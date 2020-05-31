# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

MY_PN="libwebcam"

HOMEPAGE="https://sourceforge.net/projects/libwebcam/"
DESCRIPTION="Manage dynamic controls in uvcvideo"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_PN}-src-${PV}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE="static-libs"

DEPEND="dev-libs/libxml2:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	cmake-utils_src_install
	use static-libs || rm -fr "${D}"usr/lib*/${MY_PN}.a
}
