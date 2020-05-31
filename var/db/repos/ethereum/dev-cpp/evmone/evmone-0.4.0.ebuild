# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Fast Ethereum Virtual Machine implementation"
HOMEPAGE="https://github.com/ethereum/evmone"
SRC_URI="https://github.com/ethereum/evmone/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="-test +tools"

PATCHES=(
	"${FILESDIR}/${P}-do_not_require_evmc_sources.patch"
	"${FILESDIR}/${P}-skip_benchmark_tests.patch"
	"${FILESDIR}/${P}-require_cxx_17.patch"
)

RDEPEND="dev-cpp/ethash"
DEPEND="${RDEPEND}
	dev-cpp/intx
	dev-cpp/evmc[tools]
	tools? (
		dev-cpp/gtest
	)"
BDEPEND="sys-devel/gcc
	sys-devel/make
	dev-util/cmake
	test? (
		dev-cpp/gtest
	)"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR='emake'
	local DEVMONE_TESTING='OFF'
	use test && DEVMONE_TESTING='ON'
	use tools && DEVMONE_TESTING='ON'
	local mycmakeargs=(
		"-DHUNTER_ENABLED=OFF"
		"-DEVMONE_FUZZING=OFF"
		"-DEVMC_TOOLS=OFF"
		"-DEVMC_INSTALL=OFF"
		"-DEVMONE_TESTING=${DEVMONE_TESTING}"
	)
	cmake-utils_src_configure
}

src_test() {
	use test && emake -C "${BUILD_DIR}" test
}

src_install() {
	emake -C "${BUILD_DIR}" DESTDIR="${D}" install
	use tools || rm -rf "${D}/usr/bin" "${D}/usr/sbin"
	local d
	for d in README* ChangeLog AUTHORS NEWS TODO CHANGES \
			THANKS BUGS FAQ CREDITS CHANGELOG ; do
		[[ -s "${d}" ]] && dodoc "${d}"
	done
}
