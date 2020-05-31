# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs

MY_P=${P/-/_}
DESCRIPTION="Tools and library for reading Outlook Express mailboxes (.dbx format)"
HOMEPAGE="http://sourceforge.net/projects/ol2mbox"
SRC_URI="mirror://sourceforge/ol2mbox/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	sed -i -e 's/-g/$(CFLAGS) $(LDFLAGS)/;s|gcc|$(CC)|g' Makefile || die
	tc-export CC
}

src_install() {
	dobin readoe readdbx ${FILESDIR}/dbx2mbox
	dodoc README* AUTHORS FILE-FORMAT
}
