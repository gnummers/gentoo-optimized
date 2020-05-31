# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="XKB layout switching panel plug-in for the Xfce desktop environment"
HOMEPAGE="https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin"
EGIT_REPO_URI="https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin.git"

LICENSE="BSD-2 GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="gnome-base/librsvg:=
	x11-libs/gtk+:3=
	x11-libs/libwnck:3=
	x11-libs/libX11:=
	>=x11-libs/libxklavier-5.4:=
	xfce-base/garcon:=
	>=xfce-base/libxfce4ui-4.12:=
	>=xfce-base/libxfce4util-4.12:=
	>=xfce-base/xfce4-panel-4.12:=
	>=xfce-base/xfconf-4.12.1:="
RDEPEND="${COMMON_DEPEND}
	x11-apps/setxkbmap
	>=xfce-base/xfce4-settings-4.11"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		--libexecdir="${EPREFIX}"/usr/$(get_libdir)
		--enable-maintainer-mode
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
