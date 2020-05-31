# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Gentoo MySQL init scripts."
HOMEPAGE="https://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
# This _will_ break with MySQL 5.0, 4.x, 3.x
# It also NEEDS openrc.
RDEPEND="!<dev-db/mysql-5.1 sys-apps/openrc"

src_install() {
	newconfd "${FILESDIR}/mysql-5.1.53-conf.d" "mysql"
	newinitd "${FILESDIR}/mysql-5.1.53-init.d" "mysql"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/logrotate.mysql" "mysql"
}
