# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4

inherit eutils autotools

DESCRIPTION="Asterisk Huawei 3G Dongle Channel Driver."
HOMEPAGE="http://code.google.com/p/asterisk-chan-dongle/"
SRC_URI="https://github.com/jstasiak/asterisk-chan-dongle/archive/asterisk11.zip"
KEYWORDS=""
S="${WORKDIR}/asterisk-chan-dongle-asterisk11"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=net-misc/asterisk-1.6.2.0"
DEPEND="${RDEPEND}"

AT_NOEAUTOMAKE=yes

src_prepare() {
	cd ${S}
	eaclocal
	eautoconf
	automake -a
}

src_install() {
	insinto /usr/$(get_libdir)/asterisk/modules
	doins "${PN/*-/}.so"
	insinto /etc/asterisk
	doins etc/dongle.conf
	newdoc README.txt README
	newdoc LICENSE.txt LICENSE
	newdoc etc/extensions.conf extensions.conf.chan_dongle
}
