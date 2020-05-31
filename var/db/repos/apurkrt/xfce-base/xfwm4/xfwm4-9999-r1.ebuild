# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Window manager for the Xfce desktop environment"
HOMEPAGE="https://docs.xfce.org/xfce/xfwm4/start"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfwm4.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="opengl startup-notification +xcomposite +xpresent"

RDEPEND=">=dev-libs/glib-2.20
	>=x11-libs/gtk+-3.20:3
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/pango
	>=x11-libs/libwnck-3.14:3
	>=xfce-base/libxfce4util-4.10:=
	>=xfce-base/libxfce4ui-4.12:=
	>=xfce-base/xfconf-4.13:=
	opengl? ( media-libs/libepoxy:=[X(+)] )
	startup-notification? ( x11-libs/startup-notification )
	xpresent? ( x11-libs/libXpresent )
	xcomposite? (
		x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXfixes
		)"
# libICE/libSM: not really used anywhere but checked by configure
#   https://bugzilla.xfce.org/show_bug.cgi?id=11914
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	x11-libs/libICE
	x11-libs/libSM
	xfce-base/exo
	virtual/pkgconfig"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

DOCS=( AUTHORS COMPOSITOR NEWS README TODO )

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_enable opengl epoxy)
		$(use_enable startup-notification)
		--enable-xsync
		--enable-render
		--enable-randr
		$(use_enable xpresent)
		$(use_enable xcomposite compositor)
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
