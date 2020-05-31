# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user unpacker

DESCRIPTION="An Electron based UI wrapper for your gopass on the command line."
HOMEPAGE="https://github.com/codecentric/gopass-ui"
EGIT_REPO_URI="https://github.com/codecentric/gopass-ui.git"
SRC_URI="https://github.com/codecentric/${PN}/releases/download/v${PV}/${PN}_${PV}_amd64.deb"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-admin/gopass"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack_deb "${PN}_${PV}_amd64.deb"
	mkdir ${P}
	mv * ${P}
}

src_install() {
    insinto /opt/gopass-ui
	doins opt/Gopass\ UI/*
	insinto /opt/gopass-ui/locales
	doins opt/Gopass\ UI/locales/*
	insinto /opt/gopass-ui/resources
	doins opt/Gopass\ UI/resources/*
	dosym /opt/gopass-ui/gopass-ui /usr/bin/gopass-ui
	fperms 0755 /opt/gopass-ui/gopass-ui
}
