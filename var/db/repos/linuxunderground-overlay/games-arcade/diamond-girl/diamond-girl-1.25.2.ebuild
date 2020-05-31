# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic

SRC_URI="http://www.netikka.net/joyr/diamond_girl/${P}.tar.xz"
KEYWORDS="~amd64 ~x86"

SLOT="0"
LICENSE="GPL-2"
DESCRIPTION="Single player puzzle game with a time constraint"

HOMEPAGE="http://www.netikka.net/joyr/diamond_girl/index.html"

IUSE="+mixer compressed-data"

RDEPEND="mixer? ( media-libs/sdl-mixer[vorbis] )
	media-libs/libsndfile
	media-libs/sdl-gfx
	media-libs/sdl-image[png]
	media-libs/lib3ds
	>=media-libs/glew-1.6.0-r1:=
	media-libs/openal"

DEPEND="${RDEPEND}
	>=dev-libs/json-c-0.11
	media-libs/libmikmod
	media-gfx/xcftools
	compressed-data? ( media-sound/vorbis-tools
		media-gfx/optipng )
	virtual/pkgconfig"

src_prepare() {
	eapply_user
	sed -i -e 's:Icon=:Icon=/usr/share/pixmaps/:' diamond-girl.desktop
}

src_configure() {
	append-cflags "-DNDEBUG"
	append-cxxflags "-DNDEBUG"
	econf --without-lua
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc CREDITS
	dodoc Changelog
	dodoc README
	dodoc README.sfx
	dodoc README.translations

	# CREDITS and Welcome.txt files are necessary in
	# /usr/share/diamond_girl
	local datadir=/usr/share/${PN}
	rm "${D}${datadir}"/Changelog
	rm "${D}${datadir}"/LIC*
	rm "${D}${datadir}"/READM*
}
