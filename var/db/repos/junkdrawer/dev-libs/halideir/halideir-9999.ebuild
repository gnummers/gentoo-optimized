# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Symbolic Expression and Statement Module for new DSLs"
HOMEPAGE="https://github.com/dmlc/HalideIR"
EGIT_REPO_URI="https://github.com/dmlc/HalideIR"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sci-libs/dmlc-core"
RDEPEND="${DEPEND}"

src_compile() {
	emake lib/libHalideIR.so
}

src_install() {
	dolib.so lib/libHalideIR.so

	cd src
	doheader -r arithmetic base ir tvm
}
