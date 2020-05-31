# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/ext/autostartx.git"

DESCRIPTION="Start X from init.d script as a user"
HOMEPAGE="https://github.com/ext/autostartx"
SRC_URI=""

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-apps/xinit"
RDEPEND="${DEPEND}"

src_install() {
	exeinto /sbin
	doexe autostartx-bin
	doexe autostartx
	newinitd autostartx-rc autostartx
	newconfd autostartx-conf autostartx
}
