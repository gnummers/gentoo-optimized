# Copyright 2015 (Flex1911)
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools

DESCRIPTION="Library of common debian-installer functions"
HOMEPAGE="https://tracker.debian.org/pkg/libdebian-installer"
SRC_URI="mirror://debian/pool/main/libd/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~mips ~ppc ~ppc64 ~sparc"
IUSE="doc"

DEPEND="virtual/libc
	sys-devel/libtool
	dev-util/pkgconfig
	sys-devel/gcc
	doc? ( app-doc/doxygen )"

RDEPEND="virtual/libc"

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake || die "emake failed"

	if use doc; then
		emake -C doc doc || die "make doc failed"
	fi
}

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"

	if use doc; then
		dohtml -r doc/html/*
	fi

	dodoc HACKING debian/changelog
}
