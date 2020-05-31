# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="IBM's typeface, IBM Plex"
HOMEPAGE="https://github.com/IBM/plex"
SRC_URI="https://github.com/IBM/plex/releases/download/v${PV}/TrueType.zip -> ${P}-TrueType.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPENDS="app-arch/unzip"

S="${WORKDIR}/TrueType"
FONT_SUFFIX="ttf"
FONT_S="${S}"

src_prepare() {
	default
	mv "${S}"/IBM-Plex-*/*.${FONT_SUFFIX} "${FONT_S}" || die
}
