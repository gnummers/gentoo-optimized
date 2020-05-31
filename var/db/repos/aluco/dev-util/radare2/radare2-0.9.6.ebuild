# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit base eutils

DESCRIPTION="Advanced command line hexadecimal editor and more"
HOMEPAGE="http://www.radare.org"
SRC_URI="http://www.radare.org/get/radare2-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
#IUSE="cparse debugger sysmagic ewf ssl"
IUSE="cparse debugger ewf ssl"

RDEPEND="ssl? ( dev-libs/openssl )
		ewf? ( app-forensics/libewf )
		"
#sysmagic? ( sys-libs/libmagic )
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	myconf=""
	use cparse && myconf="${myconf} $(use_enable cparse)"
	use debugger || myconf="${myconf} $(use_enable debugger)"
	#use sysmagic && myconf="${myconf} $(use_with sysmagic)"
	use ewf || myconf="${myconf} $(use_with ewf)"
	use ssl && myconf="${myconf} $(use_with ssl openssl)"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" INSTALL_PROGRAM="install" install || die "install failed"
}
