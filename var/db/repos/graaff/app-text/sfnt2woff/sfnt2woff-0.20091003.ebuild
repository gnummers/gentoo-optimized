# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

TAG=${PV/0./}

DESCRIPTION="A command line tool to convert TrueType/OpenType fonts to WOFF format"
HOMEPAGE="https://github.com/wget/sfnt2woff"
SRC_URI="https://github.com/wget/sfnt2woff/archive/${TAG}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${PN}-${TAG}"

src_install() {
	dodoc README.md
	dobin sfnt2woff
	dobin woff2sfnt
}
