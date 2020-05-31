# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Advanced command line hexadecimal editor and more"
HOMEPAGE="http://www.radare.org"
SRC_URI="http://www.radare.org/get/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="cparse debug debugger ssl sysmagic zlib"
IUSE="cparse debug debugger ssl"

RDEPEND=">=dev-util/capstone-3.0
		ssl? ( dev-libs/openssl:= )
"
#sysmagic? ( sys-libs/libmagic )
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf $(use_with ssl openssl) \
		  $(use_enable cparse) \
		  $(use_enable debug) \
		  $(use_enable debugger) \
		  --with-syscapstone
}
