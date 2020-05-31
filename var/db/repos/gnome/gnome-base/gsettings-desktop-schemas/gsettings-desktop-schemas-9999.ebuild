# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Collection of GSettings schemas for GNOME desktop"
HOMEPAGE="https://git.gnome.org/browse/gsettings-desktop-schemas"

LICENSE="LGPL-2.1+"
SLOT="0"
IUSE="+introspection"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~x64-macos ~sparc-solaris ~x86-solaris"
fi

RDEPEND="
	>=dev-libs/glib-2.31:2
	introspection? ( >=dev-libs/gobject-introspection-1.31.0 )
	!<gnome-base/gdm-3.8
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40
	sys-devel/gettext
	virtual/pkgconfig
"

src_configure() {
	DOCS="AUTHORS HACKING NEWS README"
	gnome2_src_configure $(use_enable introspection)
}
