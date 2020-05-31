# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Ethereum Client-VM Connector API"
HOMEPAGE="https://github.com/ethereum/evmc"
SRC_URI="https://github.com/ethereum/evmc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="-test +tools -examples"

PATCHES=(
	"${FILESDIR}/${P}-do_not_hunt_gtest.patch"
)

DEPEND=">=dev-cpp/gtest-1.9"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc
	sys-devel/make
	dev-util/cmake"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR='emake'
	local DTEST='ON' ; use test || DTEST='OFF'
	local DTOOLS='ON' ; use tools || DTOOLS='OFF'
	local DEXAMPLES='ON' ; use examples || DEXAMPLES='OFF'
	local mycmakeargs=(
		'-DHUNTER_ENABLED=OFF'
		"-DEVMC_TESTING=${DTEST}"
		"-DEVMC_TOOLS=${DTOOLS}"
		"-DEVMC_EXAMPLES=${DEXAMPLES}"
	)
	cmake-utils_src_configure
}

src_test() {
	use test && {
		${BUILD_DIR}/test/evmc-unittests
	}
}
