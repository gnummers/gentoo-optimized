# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="a GNU/Linux keylogger that works!"
HOMEPAGE="https://github.com/kernc/logkeys"
EGIT_REPO_URI="https://github.com/kernc/${PN}"

KEYWORDS=""
IUSE=""
LICENSE="GPL-3+"
SLOT="0"

DEPEND=""
RDEPEND=""

src_prepare() {
	sed "s:-Wall -O3 ::" -i ./src/Makefile.am || die
	eautoreconf
	default
}

src_install() {
	default

	newinitd "${FILESDIR}/${PN}-init.d" ${PN}
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN}
}
