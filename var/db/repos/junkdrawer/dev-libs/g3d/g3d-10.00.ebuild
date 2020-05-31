# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

MY_PN="G3D"
MY_P="${MY_PN}-${PV}-source"

DESCRIPTION="G3D - 3D Engine"
HOMEPAGE="http://g3d-cpp.sourceforge.net"
SRC_URI="mirror://sourceforge/g3d/g3d-cpp/${PV}/${MY_P}.zip"

LICENSE="BSD"
SLOT="0"
IUSE="X"
KEYWORDS="~amd64"

RDEPEND="dev-libs/libzip
		sys-libs/zlib
		virtual/glu
		media-libs/freeimage
		>=media-libs/glfw-3.0
		media-libs/assimp
		net-libs/enet:1.3
		www-servers/civetweb
		media-gfx/qrencode
		X? ( x11-libs/libX11 )"
DEPEND="${RDEPEND}
		app-arch/unzip"

S="${WORKDIR}"

src_prepare() {
	epatch "${FILESDIR}/g3d-10.00-cmake.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_has X XLIB)
	)

	cmake-utils_src_configure
}
