# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-simulation/corewars/corewars-0.9.13-r1.ebuild,v 1.7 2006/02/22 21:53:28 tupone Exp $

EAPI="5"

inherit autotools games

DESCRIPTION="Simulation game involving virtual machine code"
HOMEPAGE="http://corewars.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
	http://sourceforge.net/p/corewars/patches/_discuss/thread/947a192c/b4cd/attachment/${PN}-gtk2.patch.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2:2"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${DISTDIR}"/${PN}-gtk2.patch.gz
	epatch "${FILESDIR}"/${PV}-corewars-lm.patch
	epatch "${FILESDIR}"/${PV}-fix-get_current_dir_name-prototype.patch

	eautoreconf
}


src_configure() {
	egamesconf $(use_enable debug gcc-debug)
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins "${FILESDIR}/reroute.cw"
	dodoc ChangeLog README doc/{TODO,DIFFERENCES,INTERESTING-COMBINATIONS}
	prepgamesdirs
}
