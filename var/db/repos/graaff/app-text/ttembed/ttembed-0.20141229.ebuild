# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=3d78f2d0b523da68d7307340d02df89f6c549542

DESCRIPTION="Remove embedding limitations from TrueType fonts"
HOMEPAGE="https://github.com/hisdeedsaredust/ttembed"
SRC_URI="https://github.com/hisdeedsaredust/ttembed/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"

KEYWORDS="~amd64"

IUSE=""

S="${WORKDIR}/${PN}-${COMMIT}"

src_install() {
	dobin ttembed
	doman ttembed.1
	dodoc README.md
}
