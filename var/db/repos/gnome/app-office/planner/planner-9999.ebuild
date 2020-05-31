# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"
PYTHON_COMPAT=( python2_{6,7} )

inherit autotools eutils gnome2 python-single-r1
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Project manager for Gnome"
HOMEPAGE="http://live.gnome.org/Planner/"

SLOT="0"
LICENSE="GPL-2"
IUSE="eds examples python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
if [[ ${PV} = 9999 ]]; then
	IUSE="${IUSE} doc"
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
fi

RDEPEND="
	>=dev-libs/glib-2.6:2
	>=x11-libs/gtk+-2.14:2
	>=gnome-base/libgnomecanvas-2.10
	>=gnome-base/libgnomeui-2.10
	>=gnome-base/libglade-2.4:2.0
	>=gnome-base/gconf-2.6:2
	>=dev-libs/libxml2-2.6.27:2
	>=dev-libs/libxslt-1.1.23
	python? (
		${PYTHON_DEPS}
		>=dev-python/pygtk-2.6:2[${PYTHON_USEDEP}] )
	eds? (
		>=gnome-extra/evolution-data-server-3.6
		>=mail-client/evolution-3.6 )"

DEPEND="${RDEPEND}
	app-text/scrollkeeper
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.35.5
	gnome-base/gnome-common
	virtual/pkgconfig
"

if [[ ${PV} = 9999 ]]; then
	DEPEND="${DEPEND}
		doc? ( >=dev-util/gtk-doc-1 )"
fi

src_prepare() {
	# Find python in a faster way, bug #344231, upstream bug #654044
	epatch "${FILESDIR}"/0001-Speed-up-python-path-detection.patch

	# Fix build with eds-3.6
	epatch "${FILESDIR}"/0002-Fix-build-failure-with-evolution-data-server-3.6.patch

	[[ ${PV} != 9999 ]] && eautoreconf

	# Somehow needs this even if macro is not present
	[[ ${PV} = 9999 ]] && gnome-doc-common
	gnome2_src_prepare

}

src_configure() {
	# FIXME: disable eds backend for now, it fails, upstream bug #654005
	# We need to set compile-warnings to a different value as it doesn't use
	# standard macro: https://bugzilla.gnome.org/703067
	gnome2_src_configure \
		$(use_enable python) \
		$(use_enable python python-plugin) \
		$(use_enable eds) \
		--disable-eds-backend \
		--with-database=no \
		--disable-update-mimedb \
		--enable-compile-warnings=yes
		#$(use_enable eds eds-backend)
}

src_install() {
	# error: relink `libstorage-mrproject-1.la' with the above command before installing it
	# Try to drop workaround on next snapshot or bump
	MAKEOPTS="${MAKEOPTS} -j1" gnome2_src_install \
		sqldocdir="\$(datadir)/doc/${PF}" \
		sampledir="\$(datadir)/doc/${PF}/examples"

	if ! use examples; then
		rm -rf "${D}/usr/share/doc/${PF}/examples"
	fi
}
