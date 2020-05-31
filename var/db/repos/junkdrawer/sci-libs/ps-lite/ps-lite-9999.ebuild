# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="A lightweight parameter server interface"
HOMEPAGE="https://github.com/dmlc/ps-lite"
EGIT_REPO_URI="https://github.com/dmlc/ps-lite"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/protobuf:=
	net-libs/zeromq
	sci-libs/dmlc-core
	"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-actually-link-libraries.patch"
	"${FILESDIR}/${P}-link-protobuf-lib.patch"
	"${FILESDIR}/${P}-remove-PARENT_SCOPE-hack.patch" )

src_prepare() {
	cmake-utils_src_prepare
	rm -rf include/dmlc
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
	)

	cmake-utils_src_configure
}

src_install() {
	doheader -r include/ps

	cd "${BUILD_DIR}"
	dolib.so libpslite.so
}
