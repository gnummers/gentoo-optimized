# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit autotools eutils

DESCRIPTION="A set of fast command-line tools for manipulationg Gimp's file format XCF."
HOMEPAGE="http://henning.makholm.net/software"
SRC_URI="http://henning.makholm.net/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
# nls support is broken, we cannot USE nls flag.
IUSE=""

DEPEND=">=media-libs/libpng-1.4:0
	sys-devel/gettext
	virtual/pkgconfig"
RDEPEND=">=media-libs/libpng-1.4:0
	virtual/libintl"

src_prepare() {
	EPATCH_SOURCE="${FILESDIR}" EPATCH_SUFFIX="patch" \
	        EPATCH_FORCE="yes" epatch
	eautoreconf
}

src_configure() {
	econf --enable-nls
}
