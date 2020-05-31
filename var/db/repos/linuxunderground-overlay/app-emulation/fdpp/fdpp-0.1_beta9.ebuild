# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="FreeDOS plus-plus, 64bit DOS"
HOMEPAGE="https://github.com/stsp/fdpp"
SRC_URI="https://codeload.github.com/stsp/${PN}/tar.gz/beta-8 -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}
	sys-devel/clang
	dev-lang/nasm
	sys-devel/bison
	>=sys-devel/autoconf-2.57"

S="${WORKDIR}/fdpp-beta-8"

src_prepare() {
	sed -i "s:DBGFLAGS += -O2:DBGFLAGS += ${CFLAGS}:" fdpp/clang.mak || die
	sed -i "s:/usr/local:/usr:" fdpp/defs.mak || die
	sed -i "s/ \[GIT: \`git describe\`\]//" fdpp/makefile || die
	sed -i "s:\`git log -1 --format=%cd --date=rfc\`:20190818:" fdpp/git-rev.sh || die
	eapply_user
}
