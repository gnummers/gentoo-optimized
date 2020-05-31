# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Power manager for the Xfce desktop environment"
HOMEPAGE="https://goodies.xfce.org/projects/applications/xfce4-power-manager"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/xfce4-power-manager.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="kernel_linux networkmanager +panel-plugin policykit"

COMMON_DEPEND=">=dev-libs/glib-2.42
	>=sys-power/upower-0.99.0
	sys-power/pm-utils
	>=x11-libs/gtk+-3.14:3
	>=x11-libs/libnotify-0.7
	x11-libs/libX11
	>=x11-libs/libXrandr-1.2
	x11-libs/libXext
	x11-libs/libXtst
	>=xfce-base/xfconf-4.12:=
	>=xfce-base/libxfce4ui-4.12:=[gtk3(+)]
	>=xfce-base/libxfce4util-4.12:=
	panel-plugin? ( >=xfce-base/xfce4-panel-4.12:= )
	policykit? ( >=sys-auth/polkit-0.112 )"
RDEPEND="${COMMON_DEPEND}
	networkmanager? ( net-misc/networkmanager )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	x11-base/xorg-proto"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_enable policykit polkit)
		$(use_enable networkmanager network-manager)
		$(use_enable panel-plugin xfce4panel)
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
