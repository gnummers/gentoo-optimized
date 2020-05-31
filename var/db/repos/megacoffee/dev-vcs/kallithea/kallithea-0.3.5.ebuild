# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

### NOTES ##########################################################################
#
# When updating this ebuild, comment out all workarounds and try without them first.
# Only re-enable them if they are still required.
#
# Also check that documentation URLs are still correct.
#
####################################################################################

EAPI="5"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit user

DESCRIPTION="a web-based frontend and middleware to Mercurial and Git repositories"
HOMEPAGE="https://kallithea-scm.org/"
SRC_URI="https://files.pythonhosted.org/packages/b7/74/5d8ff9186721347d40ef486bd7246b0fc9bf53d27ed923d4bf06be8fbadf/Kallithea-0.3.5.tar.gz"

IUSE="+git mysql postgres sqlite"
REQUIRED_USE="|| ( mysql postgres sqlite )"

RDEPEND="
	dev-python/virtualenv
	git? ( dev-vcs/git )
	mysql? ( dev-db/mysql )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-lang/python:2.7[sqlite] )
"
	#mysql? ( virtual/libmysqlclient )

DEPEND="${RDEPEND}
	app-arch/unzip
	sys-apps/sed"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT_PYTHON_ABIS="3.*"

installDataPath="/var/lib/kallithea"
installBasePath="/opt/kallithea"
installConfigPath="/etc/kallithea"
virtualenvActivationPath="bin/activate"

urlDocumentationSetup="http://kallithea.readthedocs.org/en/${PV}/setup.html"
urlDocumentationRhodeCode="http://kallithea.readthedocs.org/en/${PV}/readme.html#converting-from-rhodecode"
urlDocumentationMegacoffee="http://gentoo-overlay.megacoffee.net/s/docs-kallithea-apache-mod_wsgi"

pkg_setup() {
	# create user and group
	enewgroup kallithea
	enewuser kallithea -1 -1 "${installDataPath}" kallithea 
}

src_unpack() {
	unpack ${A}
	mv Kallithea-${PV} kallithea-${PV} || die "Unexpected directory structure, aborting..."
}

src_compile() {
	# not really compiling anything
	
	realWorkDir=$(pwd)
	
	# create new virtual environment
	virtualenv --python=python2.7 --no-site-packages dist/v
	
	# activate environment
	source "dist/v/${virtualenvActivationPath}"
	
	# WORKAROUND:
	# we need to make sure we have a current version of setuptools to install Kallithea's dependencies
	pip2.7 install 'setuptools>=17.1' || die "Failed to install setuptools, aborting!"

	# WORKAROUND:
	# _after_ installation on --config we need a certain version of paster to create the initial config file...
	pip2.7 install 'PasteScript==2.0.2' || die "Failed to install PasteScript, aborting!"
	
	# WORKAROUND:
	# Kallithea's attempt to install Mercurial fails, so we do it first
	pip2.7 install 'mercurial>=2.9,<3.8' || die "Failed to install Mercurial, aborting!"
	
	# WORKAROUND:
	# Kallithea needs psycopg2 for PostgreSQL support which is not currently listed as a dependency?!
	# at the time of writing 2.6.1 is current, so we limit the version to <2.7
	if use postgres ; then
		pip2.7 install 'psycopg2>=2.6,<2.7' || die "Failed to install psycopg2 (required for PostgreSQL support), aborting!"
	fi
	
	# WORKAROUND:
	# Kallithea needs MySQLdb for MySQL support which is not currently listed as a dependency?!
	# at the time of writing 1.2.5 is current, so we limit the version to <1.3
	if use mysql ; then
		pip2.7 install 'MySQL-python>=1.2,<1.3' || die "Failed to install MySQL-python (required for MySQL support), aborting!"
	fi
	
	# perform automatic installation, includes dependencies
	echo
	echo "===> output by Kallithea's setup.py"
	python2.7 setup.py install
	retval=$?
	echo "<=== Kallithea's setup.py is done, resuming ebuild code"
	echo
	
	# quit now if failed
	if [ ${retval} -ne 0 ]; then
		echo "Bad return value ${retval} from setup.py install"
		exit 1
	fi
	
	# unzip all eggs
	echo 'Unzipping all eggs...'
	cd dist/v/lib/python2.7/site-packages/ || die "site-packages not found"
	for eggname in *.egg; do
		if [ -f "${eggname}" ]; then
			mv "${eggname}" tmp.extract.zip
			unzip -d "${eggname}" tmp.extract.zip
			rm tmp.extract.zip
		fi
	done
	
	# disable Git support according to manual
	# see: http://kallithea.readthedocs.org/en/0.3.1/usage/vcs_support.html
	if ! use git ; then
		sed -i -e "/^BACKENDS\s*=\s*{/,/}/ s/^\(\s*\)\('git'\)/\1#\2/" Kallithea-${PV}-py2.7.egg/kallithea/__init__.py || die 'Failed to disable git support, aborting...'
	fi
	
	# create config
	mkdir "${realWorkDir}/etc"
	cd "${realWorkDir}/etc"
	paster make-config Kallithea production.ini || die "unable to create configuration file"
	
	# rewrite config to refer to correct default paths
	sed -i -e "s/%(here)s\(\/\(tarballcache\|data\)\)/${installDataPath//\//\\/}\1/" production.ini
	sed -i -e "s/%(here)s\(\/kallithea.db\)/${installDataPath//\//\\/}\1/" production.ini
	
	# rewrite config to only log from WARN level to "console"
	# By Kallithea defaults, handler_console logs everything from INFO level to "console".
	# As mod_wsgi logs everything from "console" to error_log this results in a huge amount
	# of unnecessary log entries which we would like to prevent.
	# NOTE: As sed syntax is hard to read... this replacement rule is prefixed with an "address" which
	#       is being defined by two regexps, effectively restricting replacements just to the
	#       handler_console section of our ini file.
	sed -i -e '/^\[handler_console\]/,/^\[/ s/level\s*=\s*INFO/level = WARN/' production.ini
	
	# rewrite config to disable debug mode
	# By default, Kallithea uses debug = true which should *NOT* be used except during development.
	# See: http://kallithea.readthedocs.org/en/0.3.1/usage/debugging.html
	sed -i -e '/^\[DEFAULT\]/,/^\[/ s/\(debug\s*=\s*\)true/\1false/' production.ini
	
	## (disabled, does not work from sandbox)
	## maintain system-unique variables from previous production.ini if available
	#previousProductionConfig="${installConfigPath}/production.ini"
	#if [ -e "${previousProductionConfig}" ]; then
	#	previousAppInstanceUUID="$(grep -oE '^\s*app_instance_uuid\s*=\s*[0-9a-f\-]+' /etc/kallithea/production.ini | cut -d'=' -f2 | tr -d ' ')"
	#	previousBeakerSessionSecret="$(grep -oE '^\s*beaker\.session\.secret\s*=\s*[0-9a-f\-]+' "${previousProductionConfig}" | cut -d'=' -f2 | tr -d ' ')"
	#	
	#	if [ ! -z "${previousAppInstanceUUID}" ]; then
	#		echo 'Transferring previous app instance UUID to new production.ini'
	#		sed -i -e "s/^\(\s*app_instance_uuid\s*=\s*\).*/\1${previousAppInstanceUUID}/" production.ini
	#	fi
	#	
	#	if [ ! -z "${previousBeakerSessionSecret}" ]; then
	#		echo 'Transferring previous Beaker session secret to new production.ini'
	#		sed -i -e "s/^\(\s*beaker\.session\.secret\s*=\s*\).*/\1${previousBeakerSessionSecret}/" production.ini
	#	fi
	#fi
	
	# remove newly generated UUID and Beaker session secret from config
	# as user should configure that instead and config diffs don't show
	# unnecessary stuff
	sed -i -e "s/^\(\s*app_instance_uuid\s*=\).*/#\1 (run uuidgen and insert the returned UUID here)/" production.ini
	sed -i -e "s/^\(\s*beaker\.session\.secret\s*=\).*/#\1 (run uuidgen and insert the returned UUID here)/" production.ini
	
	# comment out sqlite DB as we don't want users to use it by accident
	sed -i -e 's/^\(\s*\)\(sqlalchemy\.db1\.url\s*=\s*sqlite:.*\)/\1#\2/' production.ini
	
	# rename production.ini as it requires more configuration and is hard to read
	mv production.ini production.ini.example
	
	# rewrite virtualenv directory to later installation directory
	oldIFS="${IFS}"
	IFS="
	"
	echo "Searching files that need to have paths replaced when leaving portage sandbox..."
	dirtyFiles=$(grep -Ri "${realWorkDir}/dist/v" ${realWorkDir}/dist/v | grep -vE '^Binary' | cut -d':' -f1 | sort | uniq)
	for dirtyFile in ${dirtyFiles}; do
		echo "    patching ${dirtyFile}"
		sed -e "s#${realWorkDir}/dist/v#${installBasePath}#" -i "${dirtyFile}"
	done
	IFS="${oldIFS}"
	
	# create WSGI file
	cd "${realWorkDir}/etc"
	cp "${FILESDIR}/production.wsgi" .
	sed -e "s:###BASEDIR###:${installBasePath}:" -i production.wsgi
	sed -e "s:###DATADIR###:${installDataPath}:" -i production.wsgi
	sed -e "s:###CONFDIR###:${installConfigPath}:" -i production.wsgi
}

src_install() {
	# QA: no need to have anything world-writable...
	chmod o-w -R dist/v/lib/python2.7/site-packages/
	
	# just copy the virtualenv directory to /opt/kallithea
	dodir /opt
	cp -aR "${S}/dist/v" "${D}${installBasePath}"
	
	# install configuration files to /etc/kallithea
	diropts -m750 -oroot -gkallithea
	insopts -m640 -oroot -gkallithea
	insinto "${installConfigPath}"
	doins "${S}/etc/production.ini.example"
	insopts -m644 -oroot -gkallithea
	doins "${S}/etc/production.wsgi"
	
	# create data directory and subdirectories
	diropts -m2770 -okallithea -gkallithea
	keepdir "${installDataPath}"
	keepdir "${installDataPath}/data"
	keepdir "${installDataPath}/data/cache"
	keepdir "${installDataPath}/data/cache/data"
	keepdir "${installDataPath}/data/cache/lock"
	keepdir "${installDataPath}/data/index"
	keepdir "${installDataPath}/repositories"
	keepdir "${installDataPath}/tarballcache"
}

pkg_postinst() {
	#               1         2         3         4         5         6         7         8
	#      12345678901234567890123456789012345678901234567890123456789012345678901234567890
	elog  "An example configuration file has already been created so you don't need to run"
	elog  "make-config again; please copy and edit carefully on first setup:"
	elog  "    cp -a ${installConfigPath}/production.ini.example ${installConfigPath}/production.ini"
	elog  "    \$EDITOR ${installConfigPath}/production.ini"
	elog  ""
	elog  "After updates, please compare what has changed and copy any necessary changes:"
	elog  "    diff -u ${installConfigPath}/production.ini ${installConfigPath}/production.ini.example"
	elog  ""
	elog  "You still need to follow Kallithea's other setup steps according to the"
	elog  "instructions at:"
	elog  "    ${urlDocumentationSetup}"
	elog  ""
	elog  "When doing so, please mind that Kallithea was installed into a Python virtual"
	elog  "environment that has to be \"activated\" before it can be used. To do so,"
	elog  "you will have to run a dedicated shell and initialize the environment by running"
	elog  ""
	elog  "    source ${installBasePath}/${virtualenvActivationPath}"
	elog  ""
	#elog  "We altered the default config slightly. It may be best to have a look at our"
	#elog  "short example on how to setup hosting with Apache and mod_wsgi, even if you"
	#elog  "prefer another method of hosting Kallithea:"
	#elog  "    ${urlDocumentationMegacoffee}"
	#elog  ""
	#elog  "We can wrap those commands for you if you run (no prior activation needed):"
	#elog  "    emerge --config =${CATEGORY}/${PF}"
	#elog  ""
	elog  "Kallithea also provides a way to migrate your database if you are coming from"
	elog  "RhodeCode 2.2 or below. Instructions can be found at:"
	elog  "${urlDocumentationRhodeCode}"
	elog  ""
	ewarn "Bear in mind that the whole purpose of a Python virtual environment is to"
	ewarn "isolate complex dependency installations from other instances installed on the"
	ewarn "same system so you will have to remember to re-emerge this ebuild when"
	ewarn "Kallithea's dependencies received bug and in particular security fixes (assuming"
	ewarn "it allows any more recent versions to be installed)."
	
	if use sqlite ; then
		ewarn ""
		ewarn "You chose to use SQLite for Kallithea. Please be advised that this is *ONLY* for"
		ewarn "testing purposes, please avoid using SQLite in production and choose a different"
		ewarn "database instead."
	fi
}





#################################################################################################
### EVERYTHING BELOW WAS AN ATTEMPT TO ASSIST USERS ON SETUP BUT CALLING EDITORS NEVER WORKED ###
### SHOULD STAY DEACTIVATED FOR NOW                                                           ###
#################################################################################################


my_read_line() {
	# BASH function 'read' cannot write input back to variable in correct environment
	# when run by emerge so we have to do *this* instead... great... :/
	# (at least this works...)

	python -c 'import sys; print(sys.stdin.readline().strip())'
}

config_menu() {
	choice=""
	
	oldIFS="${IFS}"
	IFS="
	"
	
	#              1         2         3         4         5         6         7         8
	#     12345678901234567890123456789012345678901234567890123456789012345678901234567890
	echo
	echo "==============================================================================="
	echo
	echo "Your options:"
	echo
	echo "  1) create production config from template (paster make-config ...)"
	echo "  2) edit production config"
	echo "  3) initialize Kallithea (paster setup-db)"
	echo "     This will also ask for repository location and create an admin account."
	echo "  0) quit"
	echo "     Kallithea should be able to run now, check documentation for more options"
	echo "     such as setting up a task queue or full text search if you need it."
	echo
	
	echo "TERM is ${TERM}"
	
	while [[ ! "${choice}" =~ ^[0-3]$ ]]; do
		echo -n "Your choice? "
		choice=$(my_read_line)
	done
	
	IFS="${oldIFS}"
	
	return ${choice}
}

pkg_config() {
	echo "Erm... You are not supposed to call --config as it has not been completed."
	echo "Sorry, you will have to follow the docs yourself for now, see:"
	echo "  ${urlDocumentationSetup}"
	echo
	echo
	exit 1
	
	#              1         2         3         4         5         6         7         8
	#     12345678901234567890123456789012345678901234567890123456789012345678901234567890
	
	echo "Kallithea setup requires following multiple steps, some of which need to be run"
	echo "in the correct virtual Python environment. This script helps you running those"
	echo "commands by wrapping the commands to be run inside the correct virtualenv."
	echo "You may still want to read the setup instructions while running this script:"
	echo
	echo "  ${urlDocumentationSetup}"
	
	# activate virtualenv
	cd ${installBasePath} || die "installation is gone? (${installBasePath})"
	source "${virtualenvActivationPath}" || die "failed to activate virtualenv (${installBasePath}/${virtualenvActivationPath})"
	
	configFileName='production.ini'
	
	while true; do
		config_menu
		choice=$?
		echo
		
		case "${choice}" in
			0) 	break
				;;
			
			1)	mkdir -p "${installBasePath}/etc"
				cd "${installBasePath}/etc"
				
				shouldCreate="y"
				if [ -e "${configFileName}" ]; then
					shouldCreate=""
					while true; do
						echo "${configFileName} already exists, overwrite?"
					        while [[ ! "${shouldCreate}" =~ ^[yn]$ ]]; do
					                echo -n "Enter y to overwrite, n to abort: "
					                shouldCreate=$(my_read_line)
					        done
					done
				fi

				if [ "${shouldCreate}" == 'y' ]; then
					echo 'Creating configuration file...'
					paster make-config Kallithea ${configFileName}
				else
					echo 'Aborted, configuration file has not been overwritten.'
				fi
				;;
			
			2)	iniPath="${installBasePath}/etc/${configFileName}"
				
				if [ ! -e "${iniPath}" ]; then
					echo "config not found at ${iniPath}; did you follow step 1?"
					continue
				fi
				
				# terminal and shell need a reset or editor will be screwed up
				source /etc/profile
				reset
				stty sane
				
				# open editor
				if [[ "${EDITOR}" != "" ]] && [ -e "${EDITOR}" ]; then
					TERM="xterm" ${EDITOR} "${iniPath}"
				else
					TERM="xterm" nano -w "${iniPath}"
				fi

				# we better reset again...
				source /etc/profile
				reset
				stty sane
				;;
			
			*)	echo "invalid choice ${choice}"
				;;
		esac
	done
}
