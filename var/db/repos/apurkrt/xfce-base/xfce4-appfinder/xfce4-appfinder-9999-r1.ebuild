# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop"
HOMEPAGE="https://docs.xfce.org/xfce/xfce4-appfinder/start"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfce4-appfinder.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.42
	>=x11-libs/gtk+-3.20:3
	>=xfce-base/garcon-0.3:=
	>=xfce-base/libxfce4util-4.11:=
	>=xfce-base/libxfce4ui-4.11:=[gtk3(+)]
	>=xfce-base/xfconf-4.10:=
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		--enable-maintainer-mode
	)

	econf "${myconf[@]}"
}
