# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# 

EAPI=2
inherit eutils toolchain-funcs games

DESCRIPTION="Rogue-like complex game of dungeon exploration"
HOMEPAGE="http://www.alcyone.com/max/projects/omega/"
SRC_URI="http://www.alcyone.com/binaries/omega/omega-${PV}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=sys-libs/ncurses-5"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoo-omega.patch
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dodir "${GAMES_BINDIR}" "${GAMES_DATADIR}/${PN}" "${GAMES_STATEDIR}/${PN}"
	emake DESTDIR="${D}" install_not_suid || die "emake install failed"

	doman docs/omega.6
	dodoc docs/{omega.txt,readme{3,4,.1st}}

	prepgamesdirs
}
