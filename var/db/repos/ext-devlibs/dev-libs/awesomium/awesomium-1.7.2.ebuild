# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

MY_P="${PN}_${PV//\./_}_sdk_linux64"

DESCRIPTION="HTML UI Engine"
HOMEPAGE="http://www.awesomium.com"
SRC_URI="http://www.awesomium.com/downloads/${MY_P}.tar.gz"
RESTRICT="fetch mirror"

LICENSE="awesomium"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_nofetch() {
	einfo "Please visit $SRC_URI"
	einfo "And place $A in ${DISTDIR}"
}

src_unpack(){
	unpack ${MY_P}.tar.gz
	mv "${PN}_v${PV}_sdk_linux64" "${S}"
	cd "${S}"
}

src_compile(){
	einfo "derp"
}

src_install(){
	dolib bin/awesomium_process
	dolib bin/libawesomium-1-7.so.2.0
	dosym /usr/lib/libawesomium-1-7.so.2.0 /usr/lib/libawesomium-1-7.so.2
	dosym /usr/lib/libawesomium-1-7.so.2 /usr/lib/libawesomium-1-7.so

	dodir /usr/include/Awesomium
	insinto /usr/include/Awesomium
	for x in include/Awesomium/*; do
		doins "$x"
	done
}
