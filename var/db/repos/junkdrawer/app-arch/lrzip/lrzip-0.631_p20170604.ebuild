# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

EGIT_COMMIT=1510f4a26a31479084c3d8e47543d2657a3935ad

DESCRIPTION="Long Range ZIP or Lzma RZIP optimized for compressing large files"
HOMEPAGE="https://github.com/ckolivas/lrzip"
#SRC_URI="http://ck.kolivas.org/apps/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/ckolivas/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="static-libs"

RDEPEND="dev-libs/lzo
	 app-arch/bzip2
	 sys-libs/zlib"
DEPEND="${RDEPEND}
	x86? ( dev-lang/nasm )
	virtual/perl-Pod-Parser"

PATCHES=(
	"${FILESDIR}"/${PN}-missing-stdarg_h.patch
	"${FILESDIR}"/${PN}-0.631-solaris.patch
)

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	prune_libtool_files
}
