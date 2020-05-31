# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 autotools

DESCRIPTION="Slideshow is a kiosk-style application for showing media in a loop."
HOMEPAGE="https://ext.github.io/slideshow/"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug +sdl +sqlite dbus +mysql"

DEPEND="dev-libs/libportable
dev-libs/datapack
virtual/opengl
media-libs/glew:0
media-libs/devil
x11-base/xorg-x11
sdl? ( media-libs/libsdl )
mysql? ( dev-db/mysql )
sqlite? ( dev-db/sqlite:3 )
dbus? ( sys-apps/dbus dev-libs/dbus-glib )"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://github.com/ext/slideshow.git"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_with dbus) \
		$(use_with sdl) \
		$(use_with sqlite sqlite3) \
		$(use_with mysql)
}
