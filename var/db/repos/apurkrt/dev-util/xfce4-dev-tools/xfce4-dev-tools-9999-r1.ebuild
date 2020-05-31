# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="A set of scripts and m4/autoconf macros that ease build system maintenance"
HOMEPAGE="https://www.xfce.org http://users.xfce.org/~benny/projects/xfce4-dev-tools"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfce4-dev-tools.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.42"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}
