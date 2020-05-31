# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CMAKE_MIN_VERSION=3.2.0
inherit cmake-utils

DESCRIPTION="Warp speed Data Transfer aims to make network data transfers as fast as possible"
HOMEPAGE="https://www.facebook.com/WdtOpenSource"
if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/facebook/wdt.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/facebook/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-cpp/folly-0.52.0-r1
		dev-cpp/glog
		>=dev-cpp/gflags-2.1.2
		dev-libs/openssl:0"
DEPEND="${RDEPEND}
		test? ( dev-cpp/gmock )"

PATCHES=( "${FILESDIR}/wdt-1.26.1603040-use-shared-folly.diff" )

S="${WORKDIR}/wdt"

src_unpack() {
	unpack "${P}.tar.gz"
	mv "${P}" "wdt"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build test TESTING)
	)

	cmake-utils_src_configure
}
