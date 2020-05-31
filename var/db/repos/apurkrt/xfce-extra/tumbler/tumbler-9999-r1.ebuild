# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="A thumbnail service for Thunar"
HOMEPAGE="https://docs.xfce.org/xfce/thunar/start"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/tumbler.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="curl ffmpeg gstreamer jpeg odf pdf raw"

COMMON_DEPEND=">=dev-libs/glib-2.42:2
	media-libs/freetype:2=
	media-libs/libpng:0=
	>=sys-apps/dbus-1.6
	>=x11-libs/gdk-pixbuf-2.14:2
	curl? ( >=net-misc/curl-7.25:= )
	ffmpeg? ( >=media-video/ffmpegthumbnailer-2.0.8:= )
	gstreamer? (
		media-libs/gstreamer:1.0
		media-libs/gst-plugins-base:1.0
		)
	jpeg? ( virtual/jpeg:0= )
	odf? ( >=gnome-extra/libgsf-1.14.20:= )
	pdf? ( >=app-text/poppler-0.12.4[cairo] )
	raw? ( >=media-libs/libopenraw-0.0.8:=[gtk] )"
RDEPEND="${COMMON_DEPEND}
	>=xfce-base/thunar-1.4
	gstreamer? ( media-plugins/gst-plugins-meta:1.0 )"
DEPEND="${COMMON_DEPEND}
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
		$(use_enable curl cover-thumbnailer)
		$(use_enable jpeg jpeg-thumbnailer)
		$(use_enable ffmpeg ffmpeg-thumbnailer)
		$(use_enable gstreamer gstreamer-thumbnailer)
		$(use_enable odf odf-thumbnailer)
		$(use_enable pdf poppler-thumbnailer)
		$(use_enable raw raw-thumbnailer)
	)

	econf "${myconf[@]}"
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}
