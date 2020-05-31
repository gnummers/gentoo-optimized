# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit vala xdg-utils git-r3

DESCRIPTION="Panel for the Xfce desktop environment"
HOMEPAGE="https://docs.xfce.org/xfce/xfce4-panel/start"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfce4-panel.git"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS=""
IUSE="introspection vala"
REQUIRED_USE="vala? ( introspection )"

RDEPEND=">=dev-libs/glib-2.42
	>=x11-libs/cairo-1
	>=x11-libs/gtk+-3.22:3[introspection?]
	x11-libs/libX11
	x11-libs/libwnck:3
	>=xfce-base/exo-0.11.2:=
	>=xfce-base/garcon-0.5:=
	>=xfce-base/libxfce4ui-4.13:=
	>=xfce-base/libxfce4util-4.13:=[introspection?]
	>=xfce-base/xfconf-4.13:=
	introspection? ( dev-libs/gobject-introspection:= )"
DEPEND="${RDEPEND}
	vala? ( $(vala_depend) )
	dev-lang/perl
	dev-util/gtk-doc-am
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
		$(use_enable introspection)
		$(use_enable vala)
		--enable-maintainer-mode
	)

	use vala && vala_src_prepare
	econf "${myconf[@]}"
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
