# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

MY_PN="${PN/-bin}"

if [[ ${PV} == *_pre* ]] ; then
	GIT_COMMIT="c17601c5892eaac40a359d1392e454ad5c69db9d"
	SRC_URI="https://github.com/Logitech/slimserver/archive/${GIT_COMMIT}.zip"
	HOMEPAGE="http://github.com/Logitech/slimserver"
	S="${WORKDIR}/slimserver-${GIT_COMMIT}"
	INHERIT_VCS=""
	KEYWORDS="~amd64 ~x86"
elif [[ ${PV} == "9999" ]] ; then
	EGIT_BRANCH="public/7.9"
	EGIT_REPO_URI="https://github.com/Logitech/slimserver.git"
	HOMEPAGE="http://github.com/Logitech/slimserver"
	S="${WORKDIR}/${PN}-${PV}"
	INHERIT_VCS="git-r3"
else
	MY_PV="${PV/_*}"
	MY_P="${MY_PN}-${MY_PV}"
	SRC_DIR="LogitechMediaServer_v${PV}"
	SRC_URI="http://downloads.slimdevices.com/${SRC_DIR}/${MY_P}.tgz"
	HOMEPAGE="http://www.mysqueezebox.com/download"
	S="${WORKDIR}/${MY_P}"
	INHERIT_VCS=""
	KEYWORDS="~amd64 ~x86"
fi

inherit ${INHERIT_VCS} eutils user systemd

DESCRIPTION="Logitech Media Server (streaming audio server)"
HOMEPAGE="http://github.com/Logitech/slimserver"
LICENSE="${PN}"
RESTRICT="bindist mirror"
SLOT="0"
IUSE=""

# Installation dependencies.
DEPEND="
	!media-sound/squeezecenter
	!media-sound/squeezeboxserver
	app-arch/unzip
	"

# Runtime dependencies.
RDEPEND="
	!prefix? ( >=sys-apps/baselayout-2.0.0 )
	!prefix? ( virtual/logger )
	>=dev-lang/perl-5.8.8[ithreads]
	x86? ( <dev-lang/perl-5.23[ithreads] )
	amd64? ( <dev-lang/perl-5.27[ithreads] )
	>=dev-perl/Data-UUID-1.202
	"

# This is a binary package and contains prebuilt executable and library
# files. We need to identify those to suppress the QA warnings during
# installation.
QA_PREBUILT="
	opt/logitechmediaserver/Bin/i386-linux/*
	opt/logitechmediaserver/Bin/x86_64-linux/*
	opt/logitechmediaserver/CPAN/arch/5.24/*
	opt/logitechmediaserver/CPAN/arch/5.26/*
"

RUN_UID=logitechmediaserver
RUN_GID=logitechmediaserver

# Installation locations
OPTDIR="/opt/${MY_PN}"
VARDIR="/var/lib/${MY_PN}"
CACHEDIR="${VARDIR}/cache"
USRPLUGINSDIR="${VARDIR}/Plugins"
SVRPLUGINSDIR="${CACHEDIR}/InstalledPlugins"
CLIENTPLAYLISTSDIR="${VARDIR}/ClientPlaylists"
PREFSDIR="/etc/${MY_PN}"
LOGDIR="/var/log/${MY_PN}"
SVRPREFS="${PREFSDIR}/server.prefs"

# Old Squeezebox Server file locations
SBS_PREFSDIR='/etc/squeezeboxserver/prefs'
SBS_SVRPREFS="${SBS_PREFSDIR}/server.prefs"
SBS_VARLIBDIR='/var/lib/squeezeboxserver'
SBS_SVRPLUGINSDIR="${SBS_VARLIBDIR}/cache/InstalledPlugins"
SBS_USRPLUGINSDIR="${SBS_VARLIBDIR}/Plugins"

PATCHES=(
	"${FILESDIR}/${P}-uuid-gentoo.patch"
	"${FILESDIR}/${P}-client-playlists-gentoo.patch"
)

pkg_setup() {
	# Create the user and group if not already present
	enewgroup ${RUN_GID}
	enewuser ${RUN_UID} -1 -1 "/dev/null" ${RUN_GID}
}

src_prepare() {
	(cd Bin && rm -rf aarch64-linux arm*-linux i86pc-solaris* sparc-linux powerpc-linux)
	(cd CPAN/arch && rm -rf 5.8 5.10 5.12 5.14 5.16 5.18 5.20 5.22)
	rm -rf CPAN/arch/*/aarch64* CPAN/arch/*/arm*
	if use amd64 ; then
		rm -rf Bin/i386-linux CPAN/arch/*/i386-linux-thread-multi-64int
	elif use x86 ; then
		rm -rf Bin/x86_64-linux CPAN/arch/*/x86_64-linux-thread-multi
	fi
	default
}

src_install() {

	# The custom OS module for Gentoo - provides OS-specific path details
	cp "${FILESDIR}/gentoo-filepaths.pm" "Slim/Utils/OS/Custom.pm" || die "Unable to install Gentoo custom OS module"

	# Everthing into our package in the /opt hierarchy (LHS)
	dodir "${OPTDIR}"
	cp -aR "${S}"/* "${ED}${OPTDIR}" || die "Unable to install package files"

	# Documentation
	dodoc Changelog*.html
	dodoc Installation.txt
	dodoc License*.txt
	dodoc "${FILESDIR}/Gentoo-plugins-README.txt"
	dodoc "${FILESDIR}/Gentoo-detailed-changelog.txt"

	# Install init scripts (OpenRC)
	newconfd "${FILESDIR}/logitechmediaserver.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/logitechmediaserver.init.d" "${MY_PN}"

	# Install unit file (systemd)
	systemd_dounit "${FILESDIR}/${MY_PN}.service"

	diropts -m 0770 -o ${RUN_UID} -g ${RUN_GID}
	keepdir "${PREFSDIR}" "${CLIENTPLAYLISTSDIR}" "${USRPLUGINSDIR}" "${CACHEDIR}"

	# Initialize the log directory
	dodir "${LOGDIR}"
	touch "${ED}/${LOGDIR}/server.log"
	touch "${ED}/${LOGDIR}/scanner.log"
	touch "${ED}/${LOGDIR}/perfmon.log"
	fowners ${RUN_UID}:${RUN_GID} "${LOGDIR}/server.log"
	fowners ${RUN_UID}:${RUN_GID} "${LOGDIR}/scanner.log"
	fowners ${RUN_UID}:${RUN_GID} "${LOGDIR}/perfmon.log"

	# Install logrotate support
	insinto /etc/logrotate.d
	newins "${FILESDIR}/logitechmediaserver.logrotate.d" "${MY_PN}"
}

lms_starting_instr() {
	elog "Logitech Media Server can be started with the following command (OpenRC):"
	elog "\t/etc/init.d/logitechmediaserver start"
	elog "or (systemd):"
	elog "\tsystemctl start logitechmediaserver"
	elog ""
	elog "Logitech Media Server can be automatically started on each boot"
	elog "with the following command (OpenRC):"
	elog "\trc-update add logitechmediaserver default"
	elog "or (systemd):"
	elog "\tsystemctl enable logitechmediaserver"
	elog ""
	elog "You might want to examine and modify the following configuration"
	elog "file before starting Logitech Media Server:"
	elog "\t/etc/conf.d/logitechmediaserver"
	elog ""

	# Discover the port number from the preferences, but if it isn't there
	# then report the standard one.
	httpport=$(gawk '$1 == "httpport:" { print $2 }' "${ROOT}${SVRPREFS}" 2>/dev/null)
	elog "You may access and configure Logitech Media Server by browsing to:"
	elog "\thttp://localhost:${httpport:-9000}/"
	elog ""
}

pkg_postinst() {

	# Point user to database configuration step, if an old installation
	# of SBS is found.
	if [ -f "${SBS_SVRPREFS}" ]; then
		elog "If this is a new installation of Logitech Media Server and you"
		elog "previously used Squeezebox Server (media-sound/squeezeboxserver)"
		elog "then you may migrate your previous preferences and plugins by"
		elog "running the following command (note that this will overwrite any"
		elog "current preferences and plugins):"
		elog "\temerge --config =${CATEGORY}/${PF}"
		elog ""
	fi

	# Tell use user where they should put any manually-installed plugins.
	elog "Manually installed plugins should be placed in the following"
	elog "directory:"
	elog "\t${USRPLUGINSDIR}"
	elog ""

	# Show some instructions on starting and accessing the server.
	lms_starting_instr
}

lms_remove_db_prefs() {
	MY_PREFS=$1

	einfo "Correcting database connection configuration:"
	einfo "\t${MY_PREFS}"
	TMPPREFS="${T}"/lmsserver-prefs-$$
	touch "${EROOT}${MY_PREFS}"
	sed -e '/^dbusername:/d' -e '/^dbpassword:/d' -e '/^dbsource:/d' < "${EROOT}${MY_PREFS}" > "${TMPPREFS}"
	mv "${TMPPREFS}" "${EROOT}${MY_PREFS}"
	chown ${RUN_UID}:${RUN_GID} "${EROOT}${MY_PREFS}"
	chmod 660 "${EROOT}${MY_PREFS}"
}

pkg_config() {
	einfo "Press ENTER to migrate any preferences from a previous installation of"
	einfo "Squeezebox Server (media-sound/squeezeboxserver) to this installation"
	einfo "of Logitech Media Server."
	einfo ""
	einfo "Note that this will remove any current preferences and plugins and"
	einfo "therefore you should take a backup if you wish to preseve any files"
	einfo "from this current Logitech Media Server installation."
	einfo ""
	einfo "Alternatively, press Control-C to abort now..."
	read

	# Preferences.
	einfo "Migrating previous Squeezebox Server configuration:"
	if [ -f "${SBS_SVRPREFS}" ]; then
		[ -d "${EROOT}${PREFSDIR}" ] && rm -rf "${EROOT}${PREFSDIR}"
		einfo "\tPreferences (${SBS_PREFSDIR})"
		cp -r "${EROOT}${SBS_PREFSDIR}" "${EROOT}${PREFSDIR}"
		chown -R ${RUN_UID}:${RUN_GID} "${EROOT}${PREFSDIR}"
		chmod -R u+w,g+w "${EROOT}${PREFSDIR}"
		chmod 770 "${EROOT}${PREFSDIR}"
	fi

	# Plugins installed through the built-in extension manager.
	if [ -d "${EROOT}${SBS_SVRPLUGINSDIR}" ]; then
		einfo "\tServer plugins (${SBS_SVRPLUGINSDIR})"
		[ -d "${EROOT}${SVRPLUGINSDIR}" ] && rm -rf "${EROOT}${SVRPLUGINSDIR}"
		cp -r "${EROOT}${SBS_SVRPLUGINSDIR}" "${EROOT}${SVRPLUGINSDIR}"
		chown -R ${RUN_UID}:${RUN_GID} "${EROOT}${SVRPLUGINSDIR}"
		chmod -R u+w,g+w "${EROOT}${SVRPLUGINSDIR}"
		chmod 770 "${EROOT}${SVRPLUGINSDIR}"
	fi

	# Plugins manually installed by the user.
	if [ -d "${EROOT}${SBS_USRPLUGINSDIR}" ]; then
		einfo "\tUser plugins (${SBS_USRPLUGINSDIR})"
		[ -d "${EROOT}${USRPLUGINSDIR}" ] && rm -rf "${EROOT}${USRPLUGINSDIR}"
		cp -r "${EROOT}${SBS_USRPLUGINSDIR}" "${EROOT}${USRPLUGINSDIR}"
		chown -R ${RUN_UID}:${RUN_GID} "${EROOT}${USRPLUGINSDIR}"
		chmod -R u+w,g+w "${EROOT}${USRPLUGINSDIR}"
		chmod 770 "${EROOT}${USRPLUGINSDIR}"
	fi

	# Remove the existing MySQL preferences from Squeezebox Server (if any).
	lms_remove_db_prefs "${SVRPREFS}"

	# Phew - all done. Give some tips on what to do now.
	einfo "Done."
	einfo ""
}
