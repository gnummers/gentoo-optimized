# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit vala git-r3

DESCRIPTION="A basic utility library for the Xfce desktop environment"
HOMEPAGE="https://gitlab.xfce.org/xfce/libxfce4util"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/libxfce4util.git"

LICENSE="LGPL-2+ GPL-2+"
SLOT="0/7"
KEYWORDS=""
IUSE="introspection vala"
REQUIRED_USE="vala? ( introspection )"

RDEPEND=">=dev-libs/glib-2.42:=
	introspection? ( dev-libs/gobject-introspection:= )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc-am
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
		$(use_enable vala)
		--enable-maintainer-mode
	)

	use vala && vala_src_prepare
	econf "${myconf[@]}"
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}
