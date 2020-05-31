# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Desktop client for the Matrix protocol"
HOMEPAGE="https://github.com/Nheko-Reborn/nheko"

inherit git-r3 eutils cmake-utils xdg-utils

EGIT_REPO_URI="https://github.com/Nheko-Reborn/nheko.git"
if [[ ${PV} != "9999" ]]; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=dev-qt/qtgui-5.7.1
		>=dev-qt/qtnetwork-5.7.1
		dev-qt/qtmultimedia
		dev-qt/qtsvg
		dev-qt/qtconcurrent
		dev-qt/qtwidgets
		media-libs/fontconfig
		app-text/cmark
		dev-libs/tweeny
		dev-db/lmdb++
		"
DEPEND="${RDEPEND}
		>=dev-qt/linguist-tools-5.7.1
		dev-util/ninja
		>=dev-libs/mtxclient-0.3.0
		dev-libs/spdlog
		"

CMAKE_BUILD_TYPE=Release

src_prepare()
{
	sed -i '/-Werror/d' CMakeLists.txt || die
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=17
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
