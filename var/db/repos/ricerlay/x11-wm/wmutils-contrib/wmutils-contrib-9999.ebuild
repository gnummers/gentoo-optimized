# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

DESCRIPTION="Useful bits and pieces"
HOMEPAGE="https://github.com/wmutils/contrib"
EGIT_REPO_URI="https://github.com/wmutils/contrib"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	local S="${S}/killwa"
	emake -C "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe closest.sh
	doexe deletelock.sh
	doexe focus.sh
	doexe focus_watcher.sh
	doexe fullscreen.sh
	doexe groups.sh
	doexe rainbow.sh
	doexe snap.sh
	doexe switch_grid.sh
	doexe tile.sh
	doexe underneath.sh
	doexe wmenu.sh
	doexe workspace.sh

	local S="${S}/killwa"
	emake -C "${S}" DESTDIR="${D}" install
}
