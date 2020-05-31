# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools
inherit git-r3

DESCRIPTION="a curses-based terminal BOINC client manager"
HOMEPAGE="https://github.com/mpentler/boinctui-extended"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~9999"

IUSE=""

RDEPEND="
	dev-libs/openssl
	dev-libs/expat
	sys-libs/ncurses
"

DEPEND="
	${RDEPEND}
	sys-devel/autoconf
"

EGIT_REPO_URI="https://github.com/mpentler/boinctui-extended.git"

src_configure() {
	eautoconf
	econf
	
	# add missing -ltinfow to linker options
	sed -i -e 's/^\(LIBS\s*=.*\)/\1 -ltinfow/' Makefile
}
