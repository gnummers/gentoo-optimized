# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_6 )

inherit eutils gnome2-utils fdo-mime python-r1

DESCRIPTION="Rigo, the Sabayon Application Browser"
HOMEPAGE="http://www.sabayon.org"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+passwordless-upgrade"

SRC_URI="mirror://sabayon/sys-apps/entropy-${PV}.tar.bz2"
S="${WORKDIR}/entropy-${PV}/rigo"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${PYTHON_DEPS}
	|| (
		dev-python/pygobject-cairo:3[${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP},cairo]
	)
	~sys-apps/entropy-${PV}[${PYTHON_USEDEP}]
	~sys-apps/rigo-daemon-${PV}[${PYTHON_USEDEP}]
	sys-devel/gettext
	x11-libs/gtk+:3
	x11-libs/vte:2.91
	>=x11-misc/xdg-utils-1.1.0_rc1_p20120319"
PDEPEND="passwordless-upgrade? ( app-misc/passwordless-upgrade )"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

PATCHES=(
	"${FILESDIR}/${P}-py3.patch"
)

src_install() {
	installation() {
		emake DESTDIR="${D}" PYTHON_SITEDIR="$(python_get_sitedir)" install
		python_optimize
	}
	python_foreach_impl installation
	python_replicate_script "${ED}usr/bin/rigo"
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
