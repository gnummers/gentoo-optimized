# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools autotools-utils multilib

DESCRIPTION="GL extrusion library"
HOMEPAGE="http://www.linas.org/gle"
SRC_URI="http://www.linas.org/${PN}/pub/${P}.tar.gz"

LICENSE="Artistic GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="static-libs"

RDEPEND="virtual/opengl
	media-libs/freeglut
	app-eselect/eselect-opengl"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}/${P}-autotools-r1.patch" )
DOCS=( AUTHORS README )
HTML_DOCS=( doc/html/ )

src_prepare() {
	sed -i -e 's:malloc.h:stdlib.h:g' src/* || die #130340
	autotools-utils_src_prepare
	eautoreconf
}

src_configure() {
	myeconfargs=(
		--with-x
		--x-libraries=/usr/$(get_libdir)/opengl/xorg-x11
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	(cd man; for i in *.man; do newman ${i} ${i/.man/.3}; done)
}
