# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="A VNC server for real X displays"
HOMEPAGE="https://libvnc.github.io/"
SRC_URI="https://github.com/LibVNC/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# bug 609162
IUSE="crypt fbcon libressl ssl threads xinerama zeroconf zlib"

RDEPEND=">=net-libs/libvncserver-0.9.8[ssl?,threads=,zlib=]
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	>=x11-libs/libXtst-1.1.0
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:= )
	)
	xinerama? ( x11-libs/libXinerama )
	zeroconf? ( >=net-dns/avahi-0.6.4 )
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/libXt
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# --without-v4l because of missing video4linux 2.x support wrt #389079
	# xtrap appears to be obsoleted by xtest here
	econf \
		$(use_with crypt) \
		$(use_with fbcon fbdev) \
		$(use_with ssl) \
		$(use_with ssl crypto) \
		$(use_with xinerama) \
		$(use_with zeroconf avahi) \
		--without-v4l \
		--without-xtrap
}

src_install() {
	default
	newinitd "${FILESDIR}/${PN}.init.d" ${PN}
	newconfd "${FILESDIR}/${PN}.conf.d" ${PN}
}
