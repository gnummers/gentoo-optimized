# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit qmake-utils xdg-utils python-single-r1 git-r3

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="http://www.radare.org"
EGIT_REPO_URI="https://github.com/radareorg/cutter.git"

EGIT_SUBMODULES=( -radare2 )

LICENSE="GPL-3"
SLOT="0"
IUSE="+python"
REQUIRED_USE=""

DEPEND="
	>=dev-qt/qtcore-5.9.1:5
	>=dev-qt/qtgui-5.9.1:5
	>=dev-qt/qtsvg-5.9.1:5
	>=dev-qt/qtwidgets-5.9.1:5
	>=dev-util/radare2-9999
	>=dev-qt/qtwebengine-5.9.1:5[widgets]
	kde-frameworks/syntax-highlighting
	python? (	>=dev-python/shiboken2-5.12.5-r3
				>=dev-python/pyside2-5.12.5-r3
			)
"

RDEPEND="${DEPEND}"

src_configure() {
	local myqmakeargs=(
		CUTTER_ENABLE_PYTHON_BINDINGS=$(usex python true false)
		CUTTER_ENABLE_PYTHON=true
		CUTTER_ENABLE_KSYNTAXHIGHLIGHTING=true
		PREFIX=\'${EPREFIX}/usr\'
	)

	eqmake5 "${myqmakeargs[@]}" src
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

dpkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
