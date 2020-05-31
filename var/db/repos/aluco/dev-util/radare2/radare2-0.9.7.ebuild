# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base eutils

DESCRIPTION="Advanced command line hexadecimal editor and more"
HOMEPAGE="http://www.radare.org"
SRC_URI="http://www.radare.org/get/radare2-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
#IUSE="cparse debugger ewf gmp ssl sysmagic zlib"
IUSE="cparse debugger ewf ssl"

RDEPEND="ewf? ( app-forensics/libewf )
		ssl? ( dev-libs/openssl )
		"
#gmp? ( dev-libs/gmp )
#sysmagic? ( sys-libs/libmagic )
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf $(use ssl && echo --with-openssl) \
		  $(use ewf || echo --without-ewf) \
		  $(use cparse && echo --enable-cparse) \
		  $(use debugger || echo --disable-debugger )
}

src_install() {
	emake DESTDIR="${D}" INSTALL_PROGRAM="install" install || die "install failed"
}
