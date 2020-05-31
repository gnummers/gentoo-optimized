# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Screen saver and locker (port of MATE screensaver)"
HOMEPAGE="https://gitlab.xfce.org/apps/xfce4-screensaver"
EGIT_REPO_URI="https://gitlab.xfce.org/apps/xfce4-screensaver.git"

LICENSE="GPL-2+ LGPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="consolekit elogind +locking opengl pam systemd"

# Xrandr: optional but automagic
RDEPEND="
	>=dev-libs/dbus-glib-0.30
	>=dev-libs/glib-2.50:2
	>=x11-libs/gtk+-3.22:3
	>=x11-libs/libwnck-3.20:3
	x11-libs/libICE:=
	x11-libs/libX11:=
	x11-libs/libXScrnSaver:=
	x11-libs/libXext:=
	x11-libs/libXxf86vm:=
	>=x11-libs/libXrandr-1.3:=
	>=x11-libs/libxklavier-5.2:=
	>=xfce-base/garcon-0.5.0:=
	>=xfce-base/libxfce4ui-4.12.1:=
	>=xfce-base/libxfce4util-4.12.1:=
	>=xfce-base/xfconf-4.12.1:=
	consolekit? ( sys-auth/consolekit )
	elogind? ( sys-auth/elogind )
	locking? (
		pam? ( sys-libs/pam )
	)
	opengl? ( virtual/opengl )
	systemd? ( sys-apps/systemd:= )
"
DEPEND="${RDEPEND}
	dev-util/glib-utils
	dev-util/intltool
	sys-apps/dbus"
BDEPEND="virtual/pkgconfig
	>=dev-util/xfce4-dev-tools-9999"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		# disable docbook for now
		ac_cv_path_XMLTO=no

		# xscreensaver dirs autodetection doesn't seem to work
		--with-xscreensaverdir=/usr/share/xscreensaver/config
		--with-xscreensaverhackdir=/usr/$(get_libdir)/misc/xscreensaver
		--enable-maintainer-mode

		$(use_with opengl libgl)
		$(use_enable locking)
		$(use_enable pam)
		$(use_with consolekit console-kit)
		$(use_with elogind)
		$(use_with systemd)
	)

	if use pam; then
		myconf+=( --with-pam-auth-type=system )
	fi

	econf "${myconf[@]}"
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}
