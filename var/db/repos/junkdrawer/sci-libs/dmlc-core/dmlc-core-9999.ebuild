# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3 toolchain-funcs

DESCRIPTION="A common library for building scalable and portable distributed machine learning"
HOMEPAGE="https://github.com/dmlc/dmlc-core"
EGIT_REPO_URI="https://github.com/dmlc/dmlc-core"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
# TODO: HDFS, Azure, S3
IUSE="openmp"

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-no-doc.patch" )

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DUSE_OPENMP=$(usex openmp)
	)

	cmake-utils_src_configure
}
