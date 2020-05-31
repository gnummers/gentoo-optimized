# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

DESCRIPTION="akvcam, virtual camera for Linux"
HOMEPAGE="https://github.com/webcamoid/akvcam"
SRC_URI="https://github.com/webcamoid/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/linux-sources"

MODULE_NAMES="akvcam(extra:src:src)"
BUILD_TARGETS="all"

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile(){
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

