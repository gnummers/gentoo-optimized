# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1 git-r3

DESCRIPTION="bmwrapper is a poorly hacked together python script to let Thunderbird and PyBitmessage communicate."
HOMEPAGE="https://github.com/Arceliar/bmwrapper"
EGIT_REPO_URI="git://github.com/Arceliar/bmwrapper.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
        net-p2p/pybitmessage
	net-misc/socat"

src_compile() { :; }

src_install() {
	#python modules
	
	cd ${S}
	python_setup
	python_moduleinto ${PN}
	python_domodule *.py

	# Install README
	if use doc ; then
		dodoc README.md
	fi

	echo "#!/bin/bash" > "${T}/${PN}"
	echo "exec python2 $(python_get_sitedir)/${PN}/main.py" >> "${T}/${PN}"
	dobin "${T}/${PN}"

	doinitd ${FILESDIR}/bmwrapper
	newconfd ${FILESDIR}/bmwrapper.conf bmwrapper

	LOG_DIR="/var/log/bmwrapper"
	keepdir "${LOG_DIR}"
	fowners bitmessage:bitmessage "${LOG_DIR}"
	fperms 0770 "${LOG_DIR}"
}
