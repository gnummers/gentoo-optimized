# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

PV_SRC='0.5.1-alpha.1'
DESCRIPTION="The Ethereum Proof of Work algorithm"
HOMEPAGE="https://github.com/chfast/ethash"
SRC_URI="https://github.com/chfast/ethash/archive/v${PV_SRC}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="-test"

PATCHES=(
	"${FILESDIR}/${P}-disable_benchmark_tests.patch"
	"${FILESDIR}/${P}-fix_unit_test_link.patch"
)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc
	sys-devel/make
	dev-util/cmake
	test? ( dev-cpp/gtest )"

S="${WORKDIR}/ethash-${PV_SRC}"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR='emake'
	local DTEST='ON' ; use test || DTEST='OFF'
	local mycmakeargs=(
		'-DHUNTER_ENABLED=OFF'
		'-DETHASH_NATIVE=ON'
		"-DETHASH_BUILD_TESTS=${DTEST}"
	)
	cmake-utils_src_configure
}

src_test() {
	use test && {
		${BUILD_DIR}/test/ethash-test
	}
}
