# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VCS_INHERIT=""
if [[ "${PV}" == 9999 ]] ; then
	VCS_INHERIT="git-r3"
	EGIT_REPO_URI="https://github.com/MariaDB/connector-c.git"
	KEYWORDS=""
else
	MY_PN=${PN#mariadb-}
	SRC_URI="https://downloads.mariadb.org/f/${MY_PN}-${PV}/${P}-src.tar.gz?serve -> ${P}-src.tar.gz"
	S="${WORKDIR}"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake-utils multilib-minimal ${VCS_INHERIT}

MULTILIB_CHOST_TOOLS=( /usr/sbin/mariadb_config )

MULTILIB_WRAPPED_HEADERS+=(
	/usr/include/mariadb/my_config.h
)

DESCRIPTION="C client library for MariaDB/MySQL"
HOMEPAGE="http://mariadb.org/"
LICENSE="LGPL-2.1"

SLOT="0/2"
IUSE="mysqlcompat +ssl static-libs"

DEPEND="sys-libs/zlib:=[${MULTILIB_USEDEP}]
	virtual/libiconv:=[${MULTILIB_USEDEP}]
	ssl? ( dev-libs/openssl:0=[${MULTILIB_USEDEP}] )
	"
RDEPEND="${DEPEND}
	mysqlcompat? (
	!dev-db/mysql
	!dev-db/mysql-cluster
	!dev-db/mariadb
	!dev-db/mariadb-galera
	!dev-db/percona-server
	!dev-db/mysql-connector-c )
	"
PATCHES=( "${FILESDIR}/fix-mariadb_config-2.1.0.patch"
	"${FILESDIR}/gentoo-layout-2.2.2.patch" )

multilib_src_configure() {
	mycmakeargs+=(
		-DMYSQL_UNIX_ADDR="${EPREFIX}/var/run/mysqld/mysqld.sock"
		-DWITH_EXTERNAL_ZLIB=ON
		-DWITH_OPENSSL=$(usex ssl ON OFF)
		-DWITH_MYSQLCOMPAT=$(usex mysqlcompat ON OFF)
		-DLIB_INSTALL_DIR=$(get_libdir)
		-DPLUGIN_INSTALL_DIR=$(get_libdir)/mariadb/plugin
		-DDOCS_INSTALL_DIR=share/docs
		-DBIN_INSTALL_DIR=sbin
	)
	cmake-utils_src_configure
}

multilib_src_install_all() {
	if ! use static-libs ; then
		find "${D}" -name "*.a" -delete || die
	fi
	if use mysqlcompat ; then
		dosym ../sbin/mariadb_config /usr/bin/mysql_config
		dosym mariadb /usr/include/mysql
	fi
}
