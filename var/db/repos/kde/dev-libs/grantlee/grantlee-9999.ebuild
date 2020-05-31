# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit cmake virtualx git-r3

DESCRIPTION="C++ string template engine based on the Django template system"
HOMEPAGE="https://github.com/steveire/grantlee"
EGIT_REPO_URI=( "https://github.com/steveire/${PN}" )

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE="debug doc test"

BDEPEND="
	doc? ( app-doc/doxygen[dot] )
	test? ( dev-qt/linguist-tools:5 )
"
RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qttest:5 )
"

RESTRICT+=" !test? ( test )"

PATCHES=(
	"${FILESDIR}/${PN}-0.3.0-nonfatal-warnings.patch"
	"${FILESDIR}/${P}-slot.patch"
)

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	use doc && cmake_src_compile docs
}

src_test() {
	virtx cmake_src_test
}

src_install() {
	use doc && local HTML_DOCS=("${BUILD_DIR}/apidox/")

	cmake_src_install
}
