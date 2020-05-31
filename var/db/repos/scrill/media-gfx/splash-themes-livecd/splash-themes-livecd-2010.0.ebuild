# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Gentoo theme for gensplash consoles"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="https://github.com/downloads/scrill/scrill-overlay/gentoo-livecd-${PV}.tar.gz"

SLOT=${PV}
LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks mirror strip"

DEPEND=">=media-gfx/splashutils-1.4.1"
RDEPEND=""

pkg_setup() {
	if ! use mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	dodir /etc/splash/gentoo-livecd-${PV}
	cd "${WORKDIR}/gentoo-livecd-${PV}"
	insinto /etc/splash/gentoo-livecd-${PV}
	doins -r * || die
	cd "${WORKDIR}/gentoo-livecd-${PV}/scripts"
	exeinto /etc/splash/gentoo-livecd-${PV}/scripts
	doexe * || die
}
