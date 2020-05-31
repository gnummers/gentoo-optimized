# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

DESCRIPTION="a full featured, high performance C++ futures implementation"
HOMEPAGE="https://github.com/facebook/wangle"
SRC_URI="https://github.com/facebook/wangle/archive/v${PV}.tar.gz -> ${P}.tar.gz "

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-cpp/folly"
DEPEND="${RDEPEND}
		test? ( dev-cpp/gmock )"

S="${WORKDIR}/${P}/${PN}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build test TESTS)
	)

	cmake-utils_src_configure
}
