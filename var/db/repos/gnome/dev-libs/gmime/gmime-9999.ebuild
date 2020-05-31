# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="no"
VALA_USE_DEPEND="vapigen"

inherit eutils mono-env gnome2 vala
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Utilities for creating and parsing messages using MIME"
HOMEPAGE="http://spruce.sourceforge.net/gmime/ http://developer.gnome.org/gmime/stable/"

SLOT="2.6"
LICENSE="LGPL-2.1"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
fi
IUSE="doc mono static-libs vala"

RDEPEND="
	>=dev-libs/glib-2.18:2
	sys-libs/zlib
	>=app-crypt/gpgme-1.1.6
	mono? (
		dev-lang/mono
		>=dev-dotnet/glib-sharp-2.4.0:2 )
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.8
	virtual/pkgconfig
	doc? ( app-text/docbook-sgml-utils )
	mono? ( dev-dotnet/gtk-sharp-gapi:2 )
	vala? (
		$(vala_depend)
		>=dev-libs/gobject-introspection-1.30.0 )
"

if [[ ${PV} = 9999 ]]; then
	DEPEND="${DEPEND}
		doc? ( >=dev-util/gtk-doc-1.8 )"
fi

pkg_setup() {
	use mono && mono-env_pkg_setup
}

src_prepare() {
	use vala && vala_src_prepare
	gnome2_src_prepare
}

src_configure() {
	gnome2_src_configure \
		--enable-cryptography \
		--disable-strict-parser \
		$(use_enable mono) \
		$(use_enable static-libs static) \
		$(use_enable vala)
}

src_compile() {
	MONO_PATH="${S}" gnome2_src_compile
	if use doc; then
		emake -C docs/tutorial html
	fi
}

src_install() {
	GACUTIL_FLAGS="/root '${ED}/usr/$(get_libdir)' /gacdir '${EPREFIX}/usr/$(get_libdir)' /package ${PN}" \
		gnome2_src_install

	if use doc ; then
		docinto tutorial
		dodoc docs/tutorial/html/*
	fi
}
