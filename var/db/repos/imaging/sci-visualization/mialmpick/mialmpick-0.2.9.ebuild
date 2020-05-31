# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit autotools eutils

DESCRIPTION="3D surface renderer for CT data"
HOMEPAGE="http://mia.sourceforge.net"
SRC_URI="mirror://sourceforge/mia/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
>=x11-libs/gtk+-2.10
>=sci-libs/vistaio-1.2.16
>=sci-libs/mialm-1.0.8
media-libs/libpng
x11-libs/gtkglext
gnome-base/libgnomeui
x11-libs/gtk+:2
"

DEPENDS="app-arch/xz-utils
		${RDEPENDS}
	"
