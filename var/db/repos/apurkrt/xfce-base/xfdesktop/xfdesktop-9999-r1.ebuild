# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Desktop manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org/projects/"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfdesktop.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="debug libnotify +thunar"

RDEPEND=">=x11-libs/cairo-1.12
	>=dev-libs/glib-2.42
	>=x11-libs/gtk+-3.22:3
	>=x11-libs/libwnck-3.14:3
	x11-libs/libX11
	>=xfce-base/exo-0.11:=
	>=xfce-base/garcon-0.6:=
	>=xfce-base/libxfce4ui-4.13:=
	>=xfce-base/libxfce4util-4.13:=
	>=xfce-base/xfconf-4.12.1:=
	libnotify? ( >=x11-libs/libnotify-0.7:= )
	thunar? ( >=xfce-base/thunar-1.7:= )"
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
		$(use_enable thunar file-icons)
		$(use_enable thunar thunarx)
		$(use_enable libnotify notifications)
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
