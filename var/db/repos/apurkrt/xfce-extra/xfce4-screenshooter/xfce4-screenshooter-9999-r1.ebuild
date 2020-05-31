# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Xfce4 screenshooter application and panel plugin"
HOMEPAGE="https://gitlab.xfce.org/apps/xfce4-screenshooter/about"
EGIT_REPO_URI="https://gitlab.xfce.org/apps/xfce4-screenshooter.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.16:=
	>=net-libs/libsoup-2.26:=
	>=x11-libs/gdk-pixbuf-2.16:=
	>=x11-libs/gtk+-3.20:3=
	dev-libs/libxml2:=
	x11-libs/libX11:=
	x11-libs/libXext:=
	x11-libs/libXfixes:=
	>=xfce-base/exo-0.11:=
	>=xfce-base/xfce4-panel-4.12:=
	>=xfce-base/libxfce4util-4.10:=
	>=xfce-base/libxfce4ui-4.12:="
DEPEND="${RDEPEND}
	dev-util/glib-utils
	dev-util/intltool
	sys-apps/help2man"
BDEPEND="virtual/pkgconfig
	>=dev-util/xfce4-dev-tools-9999"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		--enable-xfixes
		--enable-maintainer-mode
	)

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
