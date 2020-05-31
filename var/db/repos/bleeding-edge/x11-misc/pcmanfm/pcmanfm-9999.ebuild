# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PLOCALES="ar be bg bn ca cs da de el en_GB es et eu fa fi fo fr gl he hr hu id
is it ja kk km ko lg lt lv ms nl pa pl pt pt_BR ro ru si sk sl sr sr@latin sv
te th tr tt_RU ug uk vi zh_CN zh_TW"
PLOCALE_BACKUP="en_GB"

inherit autotools eutils xdg-utils l10n readme.gentoo-r1

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="git://git.lxde.org/git/lxde/${PN}"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~mips ~ppc ~x86"
fi

MY_PV="${PV/_/}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Fast lightweight tabbed filemanager"
HOMEPAGE="https://wiki.lxde.org/en/PCManFM"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug +gtk3"

RDEPEND="dev-libs/glib:2
        gtk3? ( x11-libs/gtk+:3 )
        !gtk3? ( x11-libs/gtk+:2 )
	lxde-base/menu-cache
	x11-misc/shared-mime-info
	>=x11-libs/libfm-${PV}:=[gtk(+),gtk3=]
	virtual/eject
	virtual/freedesktop-icon-theme"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default

	intltoolize --force --copy --automake || die
	eautoreconf

	export LINGUAS="${LINGUAS:-${PLOCALE_BACKUP}}"
	l10n_get_locales > po/LINGUAS || die
}

src_configure() {
	econf \
		--sysconfdir="${EPREFIX}"/etc \
		$(usex gtk3 --with-gtk=3 "" "" "") \
		$(use_enable debug)
}

src_install() {
	default

	local DOC_CONTENTS="PCmanFM can optionally support the menu://applications/
	location. You should install lxde-base/lxmenu-data for that functionality."
	readme.gentoo_create_doc
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	readme.gentoo_print_elog
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
