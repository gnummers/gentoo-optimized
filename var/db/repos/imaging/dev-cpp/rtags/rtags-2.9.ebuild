# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="A c/c++ client/server indexer for c/c++/objc[++] with integration for Emacs based on clang. "
HOMEPAGE="https://github.com/Andersbakken/rtags"
SRC_URI="https://github.com/Andersbakken/rtags-releases/blob/gh-pages/${PN}-${PV}.tar.bz2"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
DEPENDS="${RDEPENDS}
	"

RDEPENDS="sys-devel/llvm:4
	"

src_configure() {
	echo "Broken because upstream doesn't include rct" || die
	local mycmakeargs=(
		-DLLVM_DIR=/usr/lib/llvm/4/lib64/cmake/llvm/
		-DCLANG_RESOURCE_DIR=/usr/lib/clang/4.0.0
	)
	cmake-utils_src_configure
}
