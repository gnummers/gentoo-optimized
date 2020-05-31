# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Intel Math Kernel Library for Deep Neural Networks"
HOMEPAGE="https://software.intel.com/en-us/mkl/features/deep-neural-networks"
SRC_URI="https://github.com/intel/mkl-dnn/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-Use-LIB_SUFFIX.patch" "${FILESDIR}/${P}-Optional-tests.patch" )

src_configure() {
	local mycmakeargs=(
		-DWITH_EXAMPLE=$(usex examples)
		-DWITH_TEST=$(usex test)
	)

	cmake-utils_src_configure
}
