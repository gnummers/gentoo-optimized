# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

COMMIT=68dd3fb3546eafcbd59c72847cd3b820e2c80c73

DESCRIPTION="ZFS backup via zfs send/recv over ssh"
HOMEPAGE="https://github.com/adaugherity/zfs-backup"
SRC_URI="https://github.com/adaugherity/zfs-backup/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/zfs-backup-${COMMIT}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	app-admin/sudo
	sys-fs/zfs
"

src_prepare() {
	# Use sudo instead of pfexec
	sed -i -e '/^PFEXEC/ s/which pfexec/which sudo/' zfs-backup.sh || die

	eapply_user
}

src_install() {
	newbin zfs-backup.sh zfs-backup
	dodoc README example-catchup.cfg example.cfg
}
