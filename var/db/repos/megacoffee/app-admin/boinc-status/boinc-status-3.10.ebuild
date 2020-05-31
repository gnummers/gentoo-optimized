# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="bash script to monitor BOINC status"
HOMEPAGE="http://www.jpmr.org/"
SRC_URI="mirror://sourceforge/boinc/${P/-status/}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}.patch"
)

src_unpack() {
	unpack ${A}
	mv boinc-${PV} ${P} || die "Failed to rename directory"
}

src_install() {
	exeinto /usr/bin
	doexe boinc-status
	
	dodoc AUTHOR CHANGES COPYING README TODO
}
