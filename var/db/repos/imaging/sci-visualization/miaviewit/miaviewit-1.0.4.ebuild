# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit autotools eutils

DESCRIPTION="3D visualization tool"
HOMEPAGE="http://mia.sourceforge.net"
SRC_URI="mirror://sourceforge/mia/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
dev-cpp/gtkglextmm
>=sci-misc/mia-2.4
media-libs/gle
media-libs/libpng
>=sci-libs/vistaio-1.2.16
dev-cpp/libxmlpp:3.0
"

DEPENDS="app-arch/xz-utils
		${RDEPENDS}
	"

src_install() {
        emake DESTDIR="${D}" install || die
}


