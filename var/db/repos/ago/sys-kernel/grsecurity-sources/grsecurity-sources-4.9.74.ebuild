# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# See https://blogs.gentoo.org/ago/2017/08/21/sys-kernel-grsecurity-sources-available

EAPI="6"

ETYPE="sources"
K_GENPATCHES_VER="not-empty" # Set to not-empty to avoid the useless download of patch-*.xz

inherit kernel-2
detect_version
detect_arch

GRSECURITY_URI="https://dev.gentoo.org/~ago/distfiles/${PN}/${PN}-extras-${PV}.tar.xz"
SRC_URI="${KERNEL_URI} ${GRSECURITY_URI} ${ARCH_URI}"

UNIPATCH_LIST="${DISTDIR}/${PN}-extras-${PV}.tar.xz"

DESCRIPTION="Unofficial port of the last public grsecurity patch plus Gentoo patchset"
HOMEPAGE="https://github.com/minipli/linux-unofficial_grsec"
IUSE="deblob"
KEYWORDS="-* ~amd64"
RDEPEND=">=sys-devel/gcc-4.5"

pkg_postinst() {
	kernel-2_pkg_postinst

	local GRADM_COMPAT="sys-apps/gradm-3.1*"

	ewarn
	ewarn "Users of grsecurity's RBAC system must ensure they are using"
	ewarn "${GRADM_COMPAT}, which is compatible with ${PF}."
	ewarn "It is strongly recommended that the following command is issued"
	ewarn "prior to booting a ${PF} kernel for the first time:"
	ewarn
	ewarn "emerge -na =${GRADM_COMPAT}"
	ewarn
}
