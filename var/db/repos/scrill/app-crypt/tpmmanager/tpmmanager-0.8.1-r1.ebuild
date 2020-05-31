# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils

DESCRIPTION="TPM management software providing an easy to use graphical user interface"
HOMEPAGE="http://projects.sirrix.com/trac/tpmmanager"
SRC_URI="mirror://sourceforge/tpmmanager/${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=">=app-crypt/trousers-0.3.0
	dev-libs/glib
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/qurl-fix.patch"
	qmake || die "qmake"
}

src_install() {
	dobin bin/tpmmanager || die "dobin"
	dodoc README || die "dodoc"
}
