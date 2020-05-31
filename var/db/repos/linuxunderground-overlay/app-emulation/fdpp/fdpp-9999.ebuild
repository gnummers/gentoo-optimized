# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="FreeDOS plus-plus, 64bit DOS"
HOMEPAGE="https://github.com/stsp/fdpp"
EGIT_REPO_URI="https://github.com/stsp/fdpp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}
	sys-devel/clang
	dev-lang/nasm
	sys-devel/bison
	>=sys-devel/autoconf-2.57"

src_prepare() {
	sed -i "s:DBGFLAGS += -O2:DBGFLAGS += ${CFLAGS}:" fdpp/clang.mak || die
	sed -i "s:/usr/local:/usr:" fdpp/defs.mak || die
	eapply_user
}
