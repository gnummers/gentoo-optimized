# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Detect and extract additional data efter end of JPEG-images"
HOMEPAGE="https://github.com/ext/jpegsplit"
SRC_URI="https://github.com/ext/jpegsplit/archive/v${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	dobin jpegsplit
}
