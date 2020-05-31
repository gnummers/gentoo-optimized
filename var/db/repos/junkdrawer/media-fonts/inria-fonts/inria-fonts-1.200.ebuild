# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="InriaFonts"
MY_P=${MY_PN}-${PV}

inherit font

DESCRIPTION="Inria Serif and Inria Sans Typeface"
HOMEPAGE="https://black-foundry.com/work/inria/"
SRC_URI="https://github.com/BlackFoundry/InriaFonts/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"
FONT_SUFFIX="ttf"
FONT_S="${S}"

src_prepare() {
	default
	mv "${S}"/fonts/*/TTF/*.${FONT_SUFFIX} "${FONT_S}" || die
}
