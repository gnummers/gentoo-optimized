# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Easy to use task manager"
HOMEPAGE="https://goodies.xfce.org/projects/applications/xfce4-taskmanager"
EGIT_REPO_URI="https://gitlab.xfce.org/apps/xfce4-taskmanager.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	x11-libs/cairo:=
	x11-libs/libX11:=
	x11-libs/libXmu:=
	>=x11-libs/gtk+-3.20:3=
	x11-libs/libwnck:3="
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		--enable-wnck
		# GTK+3 is required unconditionally anyway
		--disable-gtk2
		--disable-gksu
		--enable-maintainer-mode
	)

	econf "${myconf[@]}"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
