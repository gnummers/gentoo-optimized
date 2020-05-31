# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 gnome2 autotools

DESCRIPTION="An adaptive GTK+ theme based on Material Design Guidelines"
HOMEPAGE="https://github.com/adapta-project/adapta-gtk-theme"
SRC_URI=""
EGIT_REPO_URI="https://github.com/adapta-project/adapta-gtk-theme.git"

LICENSE="GPL-2 CC-BY-SA-4.0"
SLOT="0"
KEYWORDS=""
IUSE="gnome gnome-flashback cinnamon xfce mate openbox plank telegram gtk-next gtk-legacy chrome-legacy +parallel"

DEPEND="
	sys-devel/autoconf
	sys-devel/automake
	>=x11-libs/gtk+-2.24.30:2
	>=x11-libs/gtk+-3.20.0:3
	>=x11-themes/gtk-engines-murrine-0.98.1
	>=media-gfx/inkscape-0.91
	>=x11-libs/gdk-pixbuf-2.32.2:2
	>=dev-libs/glib-2.48.0:2
	>=dev-libs/libsass-3.3
	>=dev-lang/sassc-3.3
	dev-libs/libxml2:2
	gnome? ( >=gnome-base/gnome-shell-3.18.3  )
	parallel? ( sys-process/parallel )
"
RDEPEND="${DEPEND}"

src_prepare()
{
	eautoreconf
	gnome2_src_prepare
}

src_configure()
{
	econf \
		$(use_enable gnome) \
		$(use_enable gnome-flashback flashback) \
		$(use_enable cinnamon) \
		$(use_enable xfce) \
		$(use_enable mate) \
		$(use_enable openbox) \
		$(use_enable plank) \
		$(use_enable telegram) \
		$(use_enable gtk-next gtk_next) \
		$(use_enable gtk-legacy gtk_legacy) \
		$(use_enable chrome-legacy) \
		$(use_enable parallel)
}
