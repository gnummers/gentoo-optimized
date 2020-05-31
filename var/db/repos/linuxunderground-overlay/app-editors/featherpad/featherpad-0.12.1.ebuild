# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg-utils

MY_P="${P/featherpad/FeatherPad}"

DESCRIPTION="Lightweight Qt5 Plain-Text Editor for Linux"
HOMEPAGE="https://github.com/tsujan/FeatherPad"
SRC_URI="https://codeload.github.com/tsujan/${PN}/tar.gz/V${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X"

RDEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	X? ( dev-qt/qtx11extras:5 )
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	app-text/hunspell"

DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"

S="${WORKDIR}/${MY_P}"

src_configure() {
	eqmake5 WITHOUT_X11="$(usex X NO YES)"
}

src_install() {
	einstalldocs
	emake INSTALL_ROOT="${ED}" install
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
