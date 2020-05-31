# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGIT_REPO_URI="https://github.com/Andersbakken/${PN}"

if [[ ${PV} = 9999 ]]; then
	GIT_ECLASS="git-r3"
	EXPERIMENTAL="true"
fi

inherit  cmake-utils ${GIT_ECLASS}

DESCRIPTION="A c/c++ client/server indexer for c/c++/objc[++] with integration for Emacs based on clang. "
HOMEPAGE="https://github.com/Andersbakken/rtags"

if [[ $PV == 9999 ]]; then
	SRC_URI=""
else

	SRC_URI="https://github.com/Andersbakken/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi



LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
DEPENDS="${RDEPENDS}
	"

RDEPENDS="sys-devel/llvm:4
	"

S="${WORKDIR}/${P}"
EGIT_CHECKOUT_DIR=${S}


src_configure() {
	echo "Broken because upstream doesn't include rct" || die
	local mycmakeargs=(
		-DLLVM_DIR=/usr/lib/llvm/4/lib64/cmake/llvm/
		-DCLANG_RESOURCE_DIR=/usr/lib/clang/4.0.0
	)
	cmake-utils_src_configure
}
