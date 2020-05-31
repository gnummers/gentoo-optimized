# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION=""
HOMEPAGE="https://github.com/ext/parport_server"
SRC_URI="https://github.com/ext/parport_server/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
	mv *-parport_server-* "${S}"
}

src_install() {
		emake DESTDIR="${D}" install
		newinitd "${FILESDIR}"/parport_server.init parport_server
}
