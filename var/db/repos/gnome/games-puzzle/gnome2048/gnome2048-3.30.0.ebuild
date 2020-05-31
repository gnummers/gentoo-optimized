# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
GNOME_ORG_MODULE="gnome-2048"
VALA_MIN_API_VERSION="0.32"

inherit gnome2

DESCRIPTION="Move the tiles until you obtain the 2048 tile"
HOMEPAGE="https://wiki.gnome.org/Apps/2048"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/libgee-0.14:0.8
	dev-libs/libgnome-games-support:1=
	>=media-libs/clutter-1.12:1.0
	>=media-libs/clutter-gtk-1.6:1.0
	>=x11-libs/gtk+-3.12:3
"
DEPEND="${RDEPEND}
	dev-libs/appstream-glib
	dev-libs/libxml2:2
	dev-util/itstool
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig
"
