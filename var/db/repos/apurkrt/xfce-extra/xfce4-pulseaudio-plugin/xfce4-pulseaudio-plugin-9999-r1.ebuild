# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="A panel plug-in for PulseAudio volume control"
HOMEPAGE="https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin"
EGIT_REPO_URI="https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="debug keybinder libnotify wnck"

RDEPEND=">=dev-libs/glib-2.42.0:=
	media-sound/pulseaudio:=
	>=x11-libs/gtk+-3.20.0:3=
	>=xfce-base/libxfce4ui-4.11.0:=[gtk3(+)]
	>=xfce-base/libxfce4util-4.9.0:=
	>=xfce-base/xfce4-panel-4.11.0:=
	>=xfce-base/xfconf-4.6.0:=
	keybinder? ( dev-libs/keybinder:3= )
	libnotify? ( x11-libs/libnotify:= )
	wnck? ( x11-libs/libwnck:3= )"
DEPEND="${RDEPEND}
	dev-util/intltool"
BPEDEND="virtual/pkgconfig"

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_enable keybinder)
		$(use_enable libnotify)
		$(use_enable wnck)
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

	if ! has_version media-sound/pavucontrol; then
		elog "For the 'audio mixer...' shortcut to work, you need to install"
		elog "an external mixer application. Please either install:"
		elog
		elog "	media-sound/pavucontrol"
		elog
		elog "or specify another application to use in the 'Properties' dialog."
	fi
}

pkg_postrm() {
	xdg_icon_cache_update
}
