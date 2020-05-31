# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs user multilib-minimal

DESCRIPTION="small audio and MIDI framework part of the OpenBSD project"
HOMEPAGE="http://www.sndio.org/"
SRC_URI="http://www.${PN}.org/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa"

RDEPEND="alsa? ( media-libs/alsa-lib )"
DEPEND="${REPEND}"

pkg_setup() {
	if ! use alsa ; then
		ewarn "alsa output disabled, no local output"
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0_p20120925-configure.patch

	multilib_copy_sources
}

multilib_src_configure() {
	econf \
		$(use_enable alsa) \
		--privsep-user=${PN}d \
		--disable-sun

	tc-export CC
}

multilib_src_install_all() {
	dodir /var/lib/sndio
	newinitd "${FILESDIR}"/initd ${PN}d
	newconfd "${FILESDIR}"/confd ${PN}d
}

pkg_postinst() {
	enewuser ${PN}d -1 -1 /var/lib/${PN} audio
}
