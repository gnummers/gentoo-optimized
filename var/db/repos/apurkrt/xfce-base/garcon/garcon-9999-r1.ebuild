# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Xfce's freedesktop.org specification compatible menu implementation library"
HOMEPAGE="https://gitlab.xfce.org/xfce/garcon"
EGIT_REPO_URI="https://gitlab.xfce.org/xfce/garcon.git"

LICENSE="LGPL-2+ FDL-1.1+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.30:=
	>=x11-libs/gtk+-3.20:3=
	>=xfce-base/libxfce4ui-4.12:=[gtk3(+)]
	>=xfce-base/libxfce4util-4.12:="
DEPEND="${RDEPEND}
	dev-util/glib-utils
	dev-util/gtk-doc-am
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

DOCS=( AUTHORS HACKING NEWS README.md STATUS TODO )

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
	)

	econf "${myconf[@]}"
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}
