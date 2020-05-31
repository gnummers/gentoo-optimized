# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Blackbox flight data recorder tools"
HOMEPAGE="https://github.com/betaflight/blackbox-tools"
SRC_URI="https://github.com/betaflight/blackbox-tools/archive/v0.4.3.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-libs/cairo"
RDEPEND=""

src_install() {
	dobin obj/blackbox_decode
	dobin obj/blackbox_render
}
