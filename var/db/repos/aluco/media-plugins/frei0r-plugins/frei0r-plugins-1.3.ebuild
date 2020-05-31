# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit base eutils autotools multilib

DESCRIPTION="A minimalistic plugin API for video effects"
HOMEPAGE="http://www.piksel.org/frei0r/"
SRC_URI="http://www.piksel.no/frei0r/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="doc facedetect scale0tilt"

DEPEND="facedetect? ( media-libs/opencv )
	scale0tilt? ( media-libs/gavl )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/frei0r-${PV}

src_prepare() {
	epatch "${FILESDIR}"/${P}-no-automagic-deps.patch
	eautoreconf
}

src_configure() {
	econf $(use_enable facedetect) \
		$(use_enable scale0tilt) \
		--libdir=/usr/$(get_libdir)
}

src_install() {
	base_src_install
	use doc && dohtml -r doc/html
}
