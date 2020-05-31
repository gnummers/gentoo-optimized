# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86 ~arm"
DESCRIPTION="A split-screen multiplayer remake of BoulderDash game"

SRC_URI="http://download.wonderland.cz/${P}.tar.gz"
HOMEPAGE="http://www.wonderland.cz/software/#doubledash"

RDEPEND="media-libs/sdl-image"

DEPEND="${RDEPEND}"

IUSE=""

src_prepare() {
	eapply "${FILESDIR}"/gentoo.patch
	eapply_user
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	domenu "${FILESDIR}"/${PN}.desktop
	doicon "${FILESDIR}"/${PN}.png

	dodoc README
}
