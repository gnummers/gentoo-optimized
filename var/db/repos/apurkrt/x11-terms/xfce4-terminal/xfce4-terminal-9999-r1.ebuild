# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="A terminal emulator for the Xfce desktop environment"
HOMEPAGE="https://docs.xfce.org/apps/terminal/start"
EGIT_REPO_URI="https://gitlab.xfce.org/apps/xfce4-terminal.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="utempter"

RDEPEND=">=dev-libs/glib-2.32:2=
	>=x11-libs/gtk+-3.20.8:3=
	x11-libs/libX11:=
	>=x11-libs/vte-0.38:2.91=
	>=xfce-base/libxfce4ui-4.10:=[gtk3(+)]
	utempter? ( sys-libs/libutempter:= )"
DEPEND="${RDEPEND}
	dev-libs/libxml2
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"
BDEPEND=">=dev-util/xfce4-dev-tools-9999"

DOCS=( AUTHORS HACKING NEWS README.md THANKS )

src_prepare() {
	default
	NOCONFIGURE=1 ./autogen.sh || die
}

src_configure() {
	local myconf=(
		$(use_with utempter)
		--enable-maintainer-mode
	)

	econf "${myconf[@]}"
}
