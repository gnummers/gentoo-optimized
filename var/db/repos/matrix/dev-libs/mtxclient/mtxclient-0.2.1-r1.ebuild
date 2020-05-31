# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Client API library for Matrix, built on top of Boost.Asio"
HOMEPAGE="https://github.com/Nheko-Reborn/mtxclient"

inherit eutils cmake-utils

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Nheko-Reborn/${PN}.git"
else
	SRC_URI="https://github.com/Nheko-Reborn/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="-test"

RDEPEND="
	dev-libs/libsodium
	>=dev-libs/boost-1.66.0
	dev-libs/olm"
DEPEND="${RDEPEND}
	dev-libs/spdlog
	dev-cpp/nlohmann_json
	>=dev-util/cmake-3.11
	test? ( dev-cpp/gtest )
"
#cmake >= 3.11 needed for boost deps
src_configure() {
	local mycmakeargs=(
		-DBUILD_LIB_TESTS="$(usex test)"
		-DBUILD_LIB_EXAMPLES=OFF
	)

	cmake-utils_src_configure
}
