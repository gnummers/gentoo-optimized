# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils vala git-r3

DESCRIPTION="Unified widget and session management libs for Xfce"
HOMEPAGE="https://gitlab.xfce.org/xfce/libxfce4ui"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/libxfce4ui.git"

LICENSE="LGPL-2+ GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="debug glade introspection startup-notification vala"
REQUIRED_USE="vala? ( introspection )"

RDEPEND=">=dev-libs/glib-2.42:2=
	>=x11-libs/gtk+-3.18:3=[introspection?]
	x11-libs/libX11:=
	x11-libs/libICE:=
	x11-libs/libSM:=
	>=xfce-base/libxfce4util-4.12:=[introspection?]
	>=xfce-base/xfconf-4.12:=
	glade? ( dev-util/glade:3.10= )
	introspection? ( dev-libs/gobject-introspection:= )
	startup-notification? ( x11-libs/startup-notification:= )
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_enable introspection)
		$(use_enable startup-notification)
		$(use_enable vala)
		# requires deprecated glade:3 (gladeui-1.0), bug #551296
		--disable-gladeui
		# this one's for :3.10
		$(use_enable glade gladeui2)
		--with-vendor-info=Gentoo
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
}

pkg_postrm() {
	xdg_icon_cache_update
}
