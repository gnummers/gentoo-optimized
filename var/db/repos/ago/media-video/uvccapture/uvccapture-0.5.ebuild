# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Take a photo from webcam on your shell"
HOMEPAGE="http://staticwave.ca/source/uvccapture/"
SRC_URI="http://staticwave.ca/source/${PN}/${P}.tar.bz2"

KEYWORDS="amd64"
IUSE=""
LICENSE="GPL-2"
SLOT="0"

DEPEND="virtual/jpeg:*"
RDEPEND=""

src_prepare () {
	sed -i "s:videodev.h:videodev2.h:" uvccapture.c v4l2uvc.c || die
	eapply -p0 "${FILESDIR}/Makefile.patch"
	default
}

src_compile () {
	emake \
		CC="$(tc-getCC)" \
		LDFLAGS="${LDFLAGS}"
}

src_install () {
	dobin ${PN}
}
