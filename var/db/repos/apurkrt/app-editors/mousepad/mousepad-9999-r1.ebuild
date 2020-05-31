# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils xdg-utils git-r3

DESCRIPTION="GTK+-based editor for the Xfce Desktop Environment"
HOMEPAGE="https://gitlab.xfce.org/apps/mousepad"
EGIT_REPO_URI="https://gitlab.xfce.org/apps/mousepad.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="dbus"

RDEPEND=">=dev-libs/glib-2.42:2=
	>=xfce-base/xfconf-4.12:=
	>=x11-libs/gtk+-3.20:3=
	x11-libs/gtksourceview:3.0="
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/intltool
	sys-devel/gettext
	dbus? ( dev-util/gdbus-codegen )"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_enable dbus)
		--enable-maintainer-mode
		)

	econf "${myconf[@]}"
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
