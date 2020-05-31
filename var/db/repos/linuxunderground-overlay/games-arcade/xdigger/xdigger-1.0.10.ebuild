# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Lightweight arcade diamonds digging game for X11"

SRC_URI="http://www.ibiblio.org/pub/Linux/games/arcade/${P}.tgz"
HOMEPAGE="http://www.ibiblio.org/pub/Linux/games/arcade/"

RDEPEND="acct-group/gamestat"

DEPEND="${RDEPEND}
	x11-misc/imake"

IUSE=""

src_prepare() {
	eapply_user
	# http://patch-tracker.debian.org/patch/series/dl/xdigger/1.0.10-13+lenny1/buffers
	eapply "${FILESDIR}"/buffers
	# http://patch-tracker.debian.org/patch/series/dl/xdigger/1.0.10-13+lenny1/start-level-on-move
	eapply "${FILESDIR}"/start-level-on-move
	#
	eapply "${FILESDIR}"/QA-Notice
}

src_configure() {
	# must be hardcoded 
	sed -i \
			-e '/XDIGGER_LIB_DIR/s:lib/X11:share:' \
			-e '/XDIGGER_HISCORE_DIR/s:X11R6/scores:games:' \
			configure.h
	sed -i \
			-e 's:lib/X11:share:' \
			-e 's:X11R6/scores:games:' \
			xdigger.man
	#
	sed -i \
			-e "/BINDIR/s:bin/X11:bin:" \
			-e '/ICONDIR/s:include/X11:share:' \
			-e 's:XDIGGER_HISCORE_DIR:${D}&:' \
			Imakefile
	xmkmf
}

src_install() {
	emake DESTDIR="${ED}" install || die "emake install failed"
	emake DESTDIR="${ED}" install.man || die "emake install.man failed"

	fowners root:gamestat /var/games/xdigger.hiscore /usr/bin/xdigger
	fperms 660 /var/games/xdigger.hiscore
	fperms 2755 /usr/bin/xdigger

	dodoc README
	domenu "${FILESDIR}"/${PN}.desktop
}
