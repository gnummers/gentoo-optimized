# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 virtualx

DESCRIPTION="GtkSourceView-based text editors and IDE helper library"
HOMEPAGE="https://wiki.gnome.org/Projects/Gtef"

LICENSE="LGPL-2.1+"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="+introspection test"

RDEPEND="
	>=dev-libs/glib-2.52:2
	>=x11-libs/gtk+-3.22
	x11-libs/gtksourceview:4
	>=dev-libs/libxml2-2.5
	app-i18n/uchardet
	introspection? ( >=dev-libs/gobject-introspection-1.42:= )
	x11-libs/amtk
"
DEPEND="${DEPEND}
	test? ( dev-util/valgrind )
	>=sys-devel/gettext-0.19.4
	>=dev-util/gtk-doc-am-1.25
	virtual/pkgconfig
"

src_prepare() {
	# requires running gvfs-metadata
	sed -e 's:\(g_test_add_func.*/file/load_save_metadata_sync.*\):/*\1*/:' \
		-e 's:\(g_test_add_func.*/file/load_save_metadata_async.*\):/*\1*/:' \
		-e 's:\(g_test_add_func.*/file/set_without_load.*\):/*\1*/:' \
		-i testsuite/test-file-metadata.c || die

	gnome2_src_prepare
}

src_configure() {
	gnome2_src_configure \
		--enable-gvfs-metadata \
		$(use_enable introspection) \
		$(use_enable test valgrind)
}

src_test() {
	virtx emake check
}
