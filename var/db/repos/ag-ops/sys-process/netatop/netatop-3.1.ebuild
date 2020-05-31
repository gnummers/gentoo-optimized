# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils linux-mod

DESCRIPTION="Optional atop kmod for TCP/UDP tx/rx stats per process and per thread"
HOMEPAGE="http://www.atoptool.nl/netatop.php"
SRC_URI="http://www.atoptool.nl/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CHOST_amd64=x86_64-unknown-linux-gnu
CHOST_x86=i686-unknown-linux-gnu


BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="netatop(misc:${S}:${S}/module)"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="CC=$(tc-getBUILD_CC) KERN_DIR=${KV_DIR} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_prepare() {
	sed -i 's/extra/misc/' Makefile || die "sed expression failed"
	default_src_prepare
	eapply_user
}

src_install() {
	linux-mod_src_install
	insinto /usr/lib/modules-load.d/
	doins "${FILESDIR}"/netatop.conf
}

pkg_postinst() {
	linux-mod_pkg_postinst
}
