# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Extended precision integer C++ library."
HOMEPAGE="https://github.com/chfast/intx"
SRC_URI="https://github.com/chfast/intx/archive/v${PV}-dev.tar.gz -> ${P}-dev.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="-test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc
	sys-devel/make
	dev-util/cmake
	test? ( dev-cpp/gtest )"

S="${WORKDIR}/${P}-dev"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR='emake'
	local DTEST='ON' ; use test || DTEST='OFF'
	local mycmakeargs=(
		'-DHUNTER_ENABLED=OFF'
		'-DINTX_BENCHMARKING=OFF'
		"-DINTX_TESTING=${DTEST}"
	)
	cmake-utils_src_configure
}
