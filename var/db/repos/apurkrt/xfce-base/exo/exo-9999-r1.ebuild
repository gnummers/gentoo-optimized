# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils git-r3

DESCRIPTION="Extensions, widgets and framework library with session support for Xfce"
HOMEPAGE="https://www.xfce.org/projects/"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/exo.git"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-lang/perl-5.6
	>=dev-libs/glib-2.42
	dev-perl/URI
	>=x11-libs/gtk+-3.22:3
	>=xfce-base/libxfce4ui-4.12:=[gtk3(+)]
	>=xfce-base/libxfce4util-4.12:="
DEPEND="${RDEPEND}
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
