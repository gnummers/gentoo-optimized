# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="C/C++/ObjC language server"
HOMEPAGE="https://github.com/MaskRay/ccls"
EGIT_REPO_URI="https://github.com/MaskRay/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/rapidjson
	sys-devel/clang:=
	sys-devel/llvm:=
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_RAPIDJSON=ON
		-DCLANG_LINK_CLANG_DYLIB=1
	)
	cmake_src_configure
}
