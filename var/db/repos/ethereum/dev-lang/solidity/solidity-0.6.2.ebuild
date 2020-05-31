# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Solidity, the contract-oriented programming language."
HOMEPAGE="https://solidity.readthedocs.io/en/v${PV}/"
SRC_URI="https://github.com/ethereum/solidity/releases/download/v${PV}/solidity_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-test -z3"

PATCHES=(
	"${FILESDIR}/${P}-require_cxx_17.patch"
	"${FILESDIR}/${P}-fix_rpath_in_binaries.patch"
	"${FILESDIR}/${P}-drop_encoding_parameter_when_open_binary_file.patch"
)

DEPEND="dev-libs/boost
	z3? ( sci-mathematics/z3 )"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc
	sys-devel/make
	dev-util/cmake
	test? ( dev-cpp/evmone )"

S="${WORKDIR}/solidity_${PV}"
BUILD_DIR="${WORKDIR}/build"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR='emake'
	local DTESTS='ON' ; use test || DTESTS='OFF'
	local DOSSFUZZ='OFF' ; use test || DOSSFUZZ='OFF'
	local DUSE_Z3='ON' ; use z3 || DUSE_Z3='OFF'
	local mycmakeargs=(
		"-DBoost_USE_STATIC_LIBS=OFF"
		"-DSOLC_LINK_STATIC=OFF"
		"-DCOVERAGE=OFF"
		"-DOSSFUZZ=${DOSSFUZZ}"
		"-DTESTS=${DTESTS}"
		"-DUSE_Z3=${DUSE_Z3}"
		"-DUSE_CVC4=OFF"
	)
	cmake-utils_src_configure
}

src_install() {

	# solc dynamic dependencies
	dolib.so \
		"${BUILD_DIR}/libsolidity/libsolidity.so" \
		"${BUILD_DIR}/libyul/libyul.so" \
		"${BUILD_DIR}/libevmasm/libevmasm.so" \
		"${BUILD_DIR}/liblangutil/liblangutil.so" \
		"${BUILD_DIR}/libsolutil/libsolutil.so"

	# solc
	emake -C "${BUILD_DIR}" DESTDIR="${D}" install

	# documentation files
	local d
	for d in README* ChangeLog AUTHORS NEWS TODO CHANGES \
			THANKS BUGS FAQ CREDITS CHANGELOG ; do
		[[ -s "${d}" ]] && dodoc "${d}"
	done

}

src_test() {
	use test && {
		EVMONE='/usr/lib64/libevmone.so'
		test -e "$EVMONE" || {
			die "${EVMONE} not found! Please report this to the package maintainer."
		}
		cd "${S}/scripts"
		SMT_FLAGS="--evmonepath ${EVMONE}" \
		LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${BUILD_DIR}/libyul:${BUILD_DIR}/liblangutil" \
		SOLIDITY_BUILD_DIR=../build \
		./tests.sh
	}

}
