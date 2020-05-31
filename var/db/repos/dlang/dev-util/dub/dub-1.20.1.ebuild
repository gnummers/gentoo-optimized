# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Package and build management system for D"
HOMEPAGE="http://code.dlang.org/"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug"

GITHUB_URI="https://codeload.github.com/dlang"
SRC_URI="${GITHUB_URI}/${PN}/tar.gz/v${PV} -> ${PN}-${PV}.tar.gz"
PATCHES="${FILESDIR}/${P}-gdc-dmd-pathfix.patch"

DLANG_VERSION_RANGE="2.076-"
DLANG_PACKAGE_TYPE="single"

inherit dlang

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

d_src_compile() {
	local imports=source versions="DubApplication DubUseCurl" libs="curl z"
	dlang_compile_bin bin/dub $(<build-files.txt)
}

d_src_test() {
	echo "Test phase disabled due to multiple problems."
	#DUB="${S}/bin/dub" test/run-unittest.sh || die "Test phase failed"
}

d_src_install() {
	dobin bin/dub
	dodoc README.md
}
