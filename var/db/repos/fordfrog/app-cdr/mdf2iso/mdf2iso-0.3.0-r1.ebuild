# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils toolchain-funcs

DESCRIPTION="Alcohol 120% bin image to ISO image file converter"
HOMEPAGE="http://mdf2iso.berlios.de/"
SRC_URI="http://download.berlios.de/${PN}/${P}-src.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
DEPEND="virtual/libc"
RDEPEND="virtual/libc"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/${P}-bigfiles.patch
}

src_install() {
	dodoc ChangeLog
	dobin src/${PN} || die "dobin failed"
}
