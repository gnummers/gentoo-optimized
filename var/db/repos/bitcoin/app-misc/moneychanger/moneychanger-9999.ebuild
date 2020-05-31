# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils qmake-utils git-r3 multilib

DESCRIPTION="An intuitive QT/C++ system tray client for Open-Transactions."
HOMEPAGE="http://opentransactions.org"
EGIT_REPO_URI="git://github.com/Open-Transactions/Moneychanger.git \
			 https://github.com/Open-Transactions/Moneychanger.git"
EGIT_BRANCH="develop"
LICENSE="AGPL-3"

SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND="app-crypt/opentxs"

DEPEND="app-crypt/opentxs
		dev-libs/xmlrpc-c
		dev-qt/qtgui:5
		dev-qt/qtsql:5
		dev-qt/qtnetwork:5
		dev-qt/qtwidgets:5
		dev-qt/qtscript:5
		dev-qt/qttest:5
		dev-qt/qtcore:5"

src_configure() {
	cd "${S}"
	eqmake5 "${S}"/project/"${PN}.pro" 	LIBDIR="$(get_libdir)" || die "Configure failed"
}

src_compile() {
	cd "${S}" || die
	emake || die "Compile failed"
}

src_install() {
	dobin "${S}"/moneychanger-qt/moneychanger-qt

	if use doc ; then
		dodoc documentation/presentable_documentation/{object_connections.pdf,object_permissions.png}
		dodoc documentation/source_documentation/{object_connections.odg,object_permissions.odg}
		dodoc documentation/translating
	fi

	cd "${S}" || die
	emake DESTDIR="${D}" PREFIX="/usr" INSTALL_ROOT="${D}" install || die

	insinto /usr/share/applications
	doins "${FILESDIR}/moneychanger.desktop"
	insinto /usr/share/moneychanger/img/
	doins "${FILESDIR}/moneychanger_icon_64x64.png"
}

pkg_postinst() {
		xdg-icon-resource install --novendor --context apps --size 64 /usr/share/moneychanger/img/moneychanger_icon_64x64.png moneychangericon
}
