# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A tool for resizing BDF format fonts"
HOMEPAGE="http://openlab.jp/efont/dist/tools/bdfresize/"
SRC_URI="http://openlab.jp/efont/dist/tools/bdfresize/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( ${FILESDIR}/${P}-gcc.patch )

src_compile() {
	emake CC="$(tc-getCC)"
}
