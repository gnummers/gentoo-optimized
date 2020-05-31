# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
inherit eutils unpacker

DESCRIPTION="Models and settings editor for the OpenTX open source firmware"
HOMEPAGE="https://www.open-tx.org"
SRC_URI="http://downloads.open-tx.org/2.3/release/companion/linux/companion23_${PV}_amd64.deb"
LICENSE="GPL-3"
RESTRICT="mirror bindist strip"

SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
QA_PREBUILT="*"
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install(){
	doins -r lib usr
	insinto lib
	insinto usr
	fperms 755 /usr/local/bin/companion23 /usr/local/bin/simulator23
}
