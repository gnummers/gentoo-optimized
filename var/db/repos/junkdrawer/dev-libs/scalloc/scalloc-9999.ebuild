# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A Fast, Multicore-Scalable, Low-Fragmentation Memory Allocator"
HOMEPAGE="http://scalloc.cs.uni-salzburg.at/"
if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cksystemsgroup/scalloc"
else
	SRC_URI="https://github.com/cksystemsgroup/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD-2"
SLOT="0"
IUSE="debug"

DEPEND="dev-util/gyp"
RDEPEND=""

src_configure() {
	gyp --depth=. scalloc.gyp || die
}

src_compile() {
	if use debug; then
		BUILDTYPE=Debug
	else
		BUILDTYPE=Release
	fi

	BUILDTYPE=$BUILDTYPE make
}

src_install() {
	dolib.so out/${BUILDTYPE}/lib.target/lib${PN}.so
}
