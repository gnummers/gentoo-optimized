# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#Ebuild based on the booboo overlay version

EAPI=4

inherit eutils

# Todo: enable OpenGL (currently not compiling)
#       enable OpenCl, needs check whether OpenCL is actually usable


DESCRIPTION="Film-Quality Vector Animation (core engine)"
HOMEPAGE="http://www.synfig.org/"
SRC_URI="mirror://sourceforge/synfig/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imagemagick ffmpeg dv openexr truetype jpeg tiff fontconfig"

DEPEND="
	dev-libs/libsigc++:2
	>=dev-cpp/libxmlpp-2.6.1
	media-libs/libpng
        media-libs/mlt
	dev-libs/boost
        x11-libs/pango
        sci-libs/fftw
	>=dev-cpp/ETL-0.04.22
	ffmpeg? ( virtual/ffmpeg )
	openexr? ( media-libs/openexr )
	truetype? ( media-libs/freetype )
	fontconfig? ( media-libs/fontconfig )
	jpeg? ( virtual/jpeg )
	tiff? ( media-libs/tiff )"
RDEPEND="${DEPEND}
	dv? ( media-libs/libdv )
	imagemagick? ( media-gfx/imagemagick )"

src_configure() {
	econf \
		$(use_with ffmpeg) \
		$(use_with fontconfig) \
		$(use_with imagemagick) \
		$(use_with dv libdv) \
		$(use_with openexr ) \
		$(use_with truetype freetype) \
		$(use_with jpeg)
}

src_install() {
	default
	dodoc doc/*.txt
	insinto /usr/share/${PN}/examples
	doins examples/*.sifz
}
