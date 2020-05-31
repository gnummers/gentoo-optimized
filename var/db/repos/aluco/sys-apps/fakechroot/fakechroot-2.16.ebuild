# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools eutils

DESCRIPTION="Provide a faked chroot environment without requiring root privileges"
HOMEPAGE="http://fakechroot.alioth.debian.org/"
SRC_URI="mirror://debian/pool/main/f/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-2.14-fix_chk_fail.patch
	sed -i -e "s/-g//" src/Makefile.am || die "sed failed"
	eautoreconf
}

src_configure() {
	econf --disable-static
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc NEWS README THANKS
	find "${D}" -name '*.la' -exec rm -f '{}' +
}
