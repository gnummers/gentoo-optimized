# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit multilib-build

DESCRIPTION="Virtual for MySQL client libraries"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x64-solaris ~x86-solaris"
IUSE="static-libs"

DEPEND=""
RDEPEND="
	|| (
		dev-db/mysql-connector-c:${SLOT}[static-libs?,${MULTILIB_USEDEP}]
		dev-db/mysql:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/percona-server:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/mysql-cluster:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
	)"
