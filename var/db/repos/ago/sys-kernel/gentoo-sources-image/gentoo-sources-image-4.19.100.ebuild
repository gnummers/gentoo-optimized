# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# NOTE:
# This kernel won't work in cases where you must create a
# custom one (for example with RAID and your personal mdadm.conf)
# For now, only 4.19 lts will be maintained. At some point it
# will be switched to 5.4 lts
#
# If you notice that some modules are missing, please open a bug.

EAPI=7

inherit mount-boot

DESCRIPTION="A gentoo-sources generic kernel image"
HOMEPAGE="https://www.gentoo.org"
SRC_URI="https://dev.gentoo.org/~ago/distfiles/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="-* ~amd64"
RDEPEND="sys-kernel/linux-firmware"
RESTRICT="binchecks strip"

pkg_setup() {
	if [[ ${MERGE_TYPE} != buildonly ]]
	then
		ewarn
		ewarn
		ewarn "You may want to configure your bootloader by setting a portage HOOK (/etc/portage/bashrc)."
		ewarn "A valid example is available into /usr/share/doc/${PF}/bashrc.bz2"
		ewarn
		ewarn
	fi
}

src_install() {
	insinto /boot
	doins *-"${PV}"*

	rm "${PV}"-"${PN}"-x86_64/{build,source} || die

	insinto /lib/modules
	doins -r "${PV}"-"${PN}"-x86_64

	insinto /usr/share/doc/"${PF}"
	doins "${FILESDIR}"/bashrc
}
