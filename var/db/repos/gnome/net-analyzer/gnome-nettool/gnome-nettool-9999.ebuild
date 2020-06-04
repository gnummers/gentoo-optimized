# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="yes"

inherit eutils gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Graphical front-ends to various networking command-line"
HOMEPAGE="https://git.gnome.org/browse/gnome-nettool/"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
fi

COMMON_DEPEND="
	>=dev-libs/glib-2.25.10:2
	gnome-base/libgtop:2
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-2.90.4:3
	x11-libs/pango
"
RDEPEND="${COMMON_DEPEND}
	|| (
		net-misc/iputils
		net-analyzer/tcptraceroute
		net-analyzer/traceroute
		sys-freebsd/freebsd-usbin )
	net-analyzer/nmap
	net-dns/bind-tools
	userland_GNU? ( net-misc/netkit-fingerd net-misc/whois )
	userland_BSD? ( net-misc/bsdwhois )
"
DEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	>=dev-util/intltool-0.40
	virtual/pkgconfig
	sys-devel/gettext
"

src_configure() {
	gnome2_src_configure $(use_enable debug)
}