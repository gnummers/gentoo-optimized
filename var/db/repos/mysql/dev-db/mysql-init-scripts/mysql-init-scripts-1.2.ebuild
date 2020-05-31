# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Gentoo MySQL init scripts."
HOMEPAGE="https://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	newconfd "${FILESDIR}/mysql.conf.d" "mysql"
	newconfd "${FILESDIR}/mysqlmanager.conf.d" "mysqlmanager"

	newinitd "${FILESDIR}/mysql.rc6" "mysql"
	newinitd "${FILESDIR}/mysqlmanager.rc6" "mysqlmanager"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/logrotate.mysql" "mysql"
}
