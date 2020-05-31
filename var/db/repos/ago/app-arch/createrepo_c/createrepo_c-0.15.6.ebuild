# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# This ebuild provides an usable createrepo_c but it is
# still a draft because all configure supports, need to turned
# on into an IUSE.
# Some packages like drpm and zchunk are missing in tree at time of writing.

EAPI=7

inherit cmake cmake-utils

DESCRIPTION="C implementation of createrepo"
HOMEPAGE="https://github.com/rpm-software-management/createrepo_c"
SRC_URI="https://github.com/rpm-software-management/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/rpm:=
	app-arch/xz-utils:=
	dev-db/sqlite:=
	dev-libs/expat:=
	dev-libs/glib:=
	dev-libs/libxml2:=
	net-misc/curl:=
	sys-apps/file:="

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_BASHCOMP=OFF
		-DENABLE_DRPM=OFF
		-DENABLE_LEGACY_WEAKDEPS=OFF
		-DENABLE_PYTHON=OFF
		-DENABLE_THREADED_XZ_ENCODER=OFF
		-DWITH_LIBMODULEMD=OFF
		-DWITH_ZCHUNK=OFF
	)
	cmake-utils_src_configure
}
