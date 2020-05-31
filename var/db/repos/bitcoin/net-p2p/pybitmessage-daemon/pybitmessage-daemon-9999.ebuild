# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 git-r3

DESCRIPTION="PyBitmessage Daemon Client allows users to interact with Bitmessage through the command line."
HOMEPAGE="https://github.com/Dokument/PyBitmessage-Daemon"

EGIT_REPO_URI="git://github.com/Dokument/PyBitmessage-Daemon.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
        net-p2p/pybitmessage"

src_compile() { :; }

src_install() {
	#python modules
	
	cd ${S}
	python_setup
	python_moduleinto ${PN}
	python_domodule daemon.py

	# Install README
	if use doc ; then
		dodoc README.md
	fi

	echo "#!/bin/bash" > "${T}/${PN}"
	echo "exec python2 $(python_get_sitedir)/${PN}/daemon.py" >> "${T}/${PN}"
	dobin "${T}/${PN}"
}
