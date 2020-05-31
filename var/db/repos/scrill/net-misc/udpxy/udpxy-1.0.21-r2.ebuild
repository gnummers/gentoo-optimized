# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

REV="2"

DESCRIPTION="Daemon to relay multicast UDP traffic to client's TCP (HTTP) connection"
HOMEPAGE="http://sourceforge.net/projects/udpxy"
SRC_URI="mirror://sourceforge/${PN}/${PN}/Chipmunk-1.0/${PN}.${PV}-${REV}-prod.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${P}-${REV}"

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	dobin udpxy || die
	dosym /usr/bin/udpxy /usr/bin/udpxrec

	newinitd "${FILESDIR}"/udpxy-init.d udpxy || die
	newconfd "${FILESDIR}"/udpxy-conf.d udpxy || die
}
