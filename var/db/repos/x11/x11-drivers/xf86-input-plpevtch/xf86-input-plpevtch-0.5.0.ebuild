# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit xorg-2

DESCRIPTION="Evdev based touchscreen driver"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86"
HOMEPAGE="http://www.plop.at/en/touchscreen.html"
SRC_URI="http://download.plop.at/files/plpevtch/${P}.tar.gz"

IUSE=""

RDEPEND="x11-base/xorg-server"
DEPEND="${RDEPEND}
	x11-drivers/xf86-input-evdev
	x11-proto/xproto"

src_install() {
	xorg-2_src_install
	# file collision with evdev
	rm "${D}"/usr/include/xorg/evdev-properties.h || die
}
