# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
MY_EXTRAS_VER="20180628-0201Z"

CMAKE_MAKEFILE_GENERATOR=emake

# Keeping eutils in EAPI=6 for emktemp in pkg_config

inherit eutils flag-o-matic prefix toolchain-funcs \
	java-pkg-opt-2 user cmake-utils multilib-build

SRC_URI="http://cdn.mysql.com/Downloads/MySQL-Cluster-7.4/${PN}-gpl-${PV}.tar.gz
	https://cdn.mysql.com/archives/mysql-cluster-7.4/${PN}-gpl-${PV}.tar.gz
	http://downloads.mysql.com/archives/MySQL-Cluster-7.4/${PN}-gpl-${PV}.tar.gz"

# Gentoo patches to MySQL
if [[ "${MY_EXTRAS_VER}" != "live" && "${MY_EXTRAS_VER}" != "none" ]]; then
	SRC_URI="${SRC_URI}
		mirror://gentoo/mysql-extras-${MY_EXTRAS_VER}.tar.bz2
		https://gitweb.gentoo.org/proj/mysql-extras.git/snapshot/mysql-extras-${MY_EXTRAS_VER}.tar.bz2
		https://dev.gentoo.org/~grknight/distfiles/mysql-extras-${MY_EXTRAS_VER}.tar.bz2
		https://dev.gentoo.org/~robbat2/distfiles/mysql-extras-${MY_EXTRAS_VER}.tar.bz2
		https://dev.gentoo.org/~jmbsvicetto/distfiles/mysql-extras-${MY_EXTRAS_VER}.tar.bz2"
fi

HOMEPAGE="https://www.mysql.com/"
DESCRIPTION="A fast, multi-threaded, multi-user SQL database server"
LICENSE="GPL-2"
SLOT="0/18"
IUSE="client-libs cracklib debug jemalloc latin1 libressl numa +perl profiling selinux
	+server static static-libs systemtap tcmalloc test yassl"

# Tests always fail when libressl is enabled due to hard-coded ciphers in the tests
RESTRICT="libressl? ( test )"

REQUIRED_USE="?? ( tcmalloc jemalloc ) static? ( yassl )"

KEYWORDS="~amd64 ~x86"
# Shorten the path because the socket path length must be shorter than 107 chars
# and we will run a mysql server during test phase
S="${WORKDIR}/mysql"

if [[ "${MY_EXTRAS_VER}" == "live" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/mysql-extras.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/mysql-extras"
	EGIT_CLONE_TYPE=shallow
	MY_PATCH_DIR="${WORKDIR}/mysql-extras"
else
	MY_PATCH_DIR="${WORKDIR}/mysql-extras-${MY_EXTRAS_VER}"
fi

MY_PATCH_DIR="${WORKDIR}/mysql-extras-${MY_EXTRAS_VER}"

PATCHES=(
	"${MY_PATCH_DIR}"/01050_all_mysql_config_cleanup-5.6.patch
	"${MY_PATCH_DIR}"/02040_all_embedded-library-shared-5.5.10.patch
	"${MY_PATCH_DIR}"/20006_all_cmake_elib-mysql-5.6.35.patch
	"${MY_PATCH_DIR}"/20007_all_cmake-debug-werror-5.6.22.patch
	"${MY_PATCH_DIR}"/20009_all_mysql_myodbc_symbol_fix-5.6.patch
	"${MY_PATCH_DIR}"/20018_all_mysql-5.6.25-without-clientlibs-tools.patch
	"${MY_PATCH_DIR}"/20027_all_mysql-5.5-perl5.26-includes.patch
	"${MY_PATCH_DIR}"/20028_all_mysql-5.6-gcc7.patch
	"${MY_PATCH_DIR}"/30000_all_mysql-cluster-multilib-property.patch
)

# Be warned, *DEPEND are version-dependant
# These are used for both runtime and compiletime
COMMON_DEPEND="
	kernel_linux? (
		sys-process/procps:0=
		dev-libs/libaio:0=
	)
	net-misc/curl
	>=sys-apps/sed-4
	>=sys-apps/texinfo-4.7-r1
	jemalloc? ( dev-libs/jemalloc:0= )
	tcmalloc? ( dev-util/google-perftools:0= )
	systemtap? ( >=dev-util/systemtap-1.3:0= )
	!yassl? (
		!libressl? ( >=dev-libs/openssl-1.0.0:0= )
		libressl? ( dev-libs/libressl:0= )
	)
	>=sys-libs/zlib-1.2.3:0=
	sys-libs/ncurses:0=
	server? (
		numa? ( sys-process/numactl )
		dev-libs/libevent:0=
	)
	!client-libs? ( dev-db/mysql-connector-c[${MULTILIB_USEDEP},static-libs?] )
	${JAVA_PKG_E_DEPEND}
"
DEPEND="virtual/yacc
	static? ( sys-libs/ncurses[static-libs] )
	|| ( >=sys-devel/gcc-3.4.6 >=sys-devel/gcc-apple-4.0 )
	>=virtual/jdk-1.6
	test? ( dev-perl/JSON )
	${COMMON_DEPEND}"
RDEPEND="selinux? ( sec-policy/selinux-mysql )
	client-libs? ( !dev-db/mariadb-connector-c[mysqlcompat] !dev-db/mysql-connector-c )
	!dev-db/mariadb !dev-db/mariadb-galera !dev-db/percona-server !dev-db/mysql
	server? ( !prefix? ( dev-db/mysql-init-scripts ) )
	>=virtual/jre-1.6
	${COMMON_DEPEND}
"
# For other stuff to bring us in
# dev-perl/DBD-mysql is needed by some scripts installed by MySQL
PDEPEND="perl? ( >=dev-perl/DBD-mysql-2.9004 )"

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]] ; then
		local GCC_MAJOR_SET=$(gcc-major-version)
		local GCC_MINOR_SET=$(gcc-minor-version)
		# Bug 565584.  InnoDB now requires atomic functions introduced with gcc-4.7 on
		# non x86{,_64} arches
		if ! use amd64 && ! use x86 && [[ ${GCC_MAJOR_SET} -lt 4 || \
			${GCC_MAJOR_SET} -eq 4 && ${GCC_MINOR_SET} -lt 7 ]] ; then
			eerror "${PN} needs to be built with gcc-4.7 or later."
			eerror "Please use gcc-config to switch to gcc-4.7 or later version."
			die
		fi
	fi
	if has test ${FEATURES} && \
		use server && ! has userpriv ${FEATURES} ; then
			eerror "Testing with FEATURES=-userpriv is no longer supported by upstream. Tests MUST be run as non-root."
	fi

	# This should come after all of the die statements
	enewgroup mysql 60 || die "problem adding 'mysql' group"
	enewuser mysql 60 -1 /dev/null mysql || die "problem adding 'mysql' user"
	java-pkg_init
}

src_unpack() {
	unpack ${A}
	# Grab the patches
	[[ "${MY_EXTRAS_VER}" == "live" ]] && S="${WORKDIR}/mysql-extras" git-r3_src_unpack

	mv -f "${WORKDIR}/${PN}-gpl-${PV}" "${S}" || die
}

src_prepare() {
	java-utils-2_src_prepare
	_disable_engine() {
		echo > "${S%/}/storage/${1}/CMakeLists.txt" || die
	}

	_disable_plugin() {
		echo > "${S%/}/plugin/${1}/CMakeLists.txt" || die
	}

	if use jemalloc ; then
		echo "TARGET_LINK_LIBRARIES(mysqld jemalloc)" >> "${S}/sql/CMakeLists.txt" || die
	fi
	if use tcmalloc; then
		echo "TARGET_LINK_LIBRARIES(mysqld tcmalloc)" >> "${S}/sql/CMakeLists.txt" || die
	fi
	# Remove the centos and rhel selinux policies to support mysqld_safe under SELinux
	if [[ -d "${S}/support-files/SELinux" ]] ; then
		echo > "${S}/support-files/SELinux/CMakeLists.txt" || die
	fi

	if use libressl ; then
		sed -i 's/OPENSSL_MAJOR_VERSION STREQUAL "1"/OPENSSL_MAJOR_VERSION STREQUAL "2"/' \
			"${S}/cmake/ssl.cmake" || die
	fi
	local plugin
	local server_plugins=( semisync )
	local test_plugins=( audit_null daemon_example fulltext )
	if ! use server; then # These plugins are for the server
		for plugin in "${server_plugins[@]}" ; do
			_disable_plugin "${plugin}"
		done
	fi

	if ! use test; then # These plugins are only used during testing
		for plugin in "${test_plugins[@]}" ; do
			_disable_plugin "${plugin}"
		done
	fi

	# Don't build example
	_disable_engine example
	_disable_plugin innodb_memcached

	cmake-utils_src_prepare
}

src_configure() {
	# Bug #114895, bug #110149
	filter-flags "-O" "-O[01]"

	append-cxxflags -felide-constructors

	# bug #283926, with GCC4.4, this is required to get correct behavior.
	append-flags -fno-strict-aliasing

	CMAKE_BUILD_TYPE="RelWithDebInfo"

	# debug hack wrt #497532
	mycmakeargs=(
		-DCMAKE_C_FLAGS_RELWITHDEBINFO="$(usex debug '' '-DNDEBUG')"
		-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="$(usex debug '' '-DNDEBUG')"
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DMYSQL_DATADIR="${EPREFIX}/var/lib/mysql"
		-DSYSCONFDIR="${EPREFIX}/etc/mysql"
		-DINSTALL_BINDIR=bin
		-DINSTALL_DOCDIR=share/doc/${PF}
		-DINSTALL_DOCREADMEDIR=share/doc/${PF}
		-DINSTALL_INCLUDEDIR=include/mysql
		-DINSTALL_INFODIR=share/info
		-DINSTALL_LIBDIR=$(get_libdir)
		-DINSTALL_MANDIR=share/man
		-DINSTALL_MYSQLSHAREDIR=share/mysql
		-DINSTALL_PLUGINDIR=$(get_libdir)/mysql/plugin
		-DINSTALL_SCRIPTDIR=share/mysql/scripts
		-DINSTALL_MYSQLDATADIR="${EPREFIX}/var/lib/mysql"
		-DINSTALL_SBINDIR=sbin
		-DINSTALL_SUPPORTFILESDIR="${EPREFIX}/usr/share/mysql"
		-DCOMPILATION_COMMENT="Gentoo Linux ${PF}"
		-DWITH_UNIT_TESTS=$(usex test ON OFF)
		### TODO: make this system but issues with UTF-8 prevent it
		-DWITH_EDITLINE=bundled
		-DWITH_ZLIB=system
		-DWITH_LIBWRAP=0
		-DENABLED_LOCAL_INFILE=1
		-DMYSQL_UNIX_ADDR="${EPREFIX}/var/run/mysqld/mysqld.sock"
		-DWITH_DEFAULT_COMPILER_OPTIONS=0
		-DWITH_DEFAULT_FEATURE_SET=0
		# The build forces this to be defined when cross-compiling.  We pass it
		# all the time for simplicity and to make sure it is actually correct.
		-DSTACK_DIRECTION=$(tc-stack-grows-down && echo -1 || echo 1)
		-DWITH_LIBEVENT=NO
		-DWITHOUT_CLIENTLIBS=YES
		-DENABLE_DTRACE=$(usex systemtap)
		-DWITH_SSL=$(usex yassl bundled system)
		-DINSTALL_MYSQLTESTDIR=$(usex test 'share/mysql/mysql-test' '')
		-DWITHOUT_VALIDATE_PASSWORD=1
	)

	if use server ; then

		if [[ ( -n ${MYSQL_DEFAULT_CHARSET} ) && ( -n ${MYSQL_DEFAULT_COLLATION} ) ]]; then
			ewarn "You are using a custom charset of ${MYSQL_DEFAULT_CHARSET}"
			ewarn "and a collation of ${MYSQL_DEFAULT_COLLATION}."
			ewarn "You MUST file bugs without these variables set."

			mycmakeargs+=(
				-DDEFAULT_CHARSET=${MYSQL_DEFAULT_CHARSET}
				-DDEFAULT_COLLATION=${MYSQL_DEFAULT_COLLATION}
			)

		elif ! use latin1 ; then
			mycmakeargs+=(
				-DDEFAULT_CHARSET=utf8
				-DDEFAULT_COLLATION=utf8_general_ci
			)
		else
			mycmakeargs+=(
				-DDEFAULT_CHARSET=latin1
				-DDEFAULT_COLLATION=latin1_swedish_ci
			)
		fi
		mycmakeargs+=(
			-DWITH_NUMA=$(usex numa ON OFF)
			-DEXTRA_CHARSETS=all
			-DDISABLE_SHARED=$(usex static YES NO)
			-DWITH_DEBUG=$(usex debug)
			-DWITH_EMBEDDED_SERVER=OFF
			-DENABLED_PROFILING=$(usex profiling)
		)

		if use static; then
			mycmakeargs+=( -DWITH_PIC=1 )
		fi

		# Storage engines
		mycmakeargs+=(
			-DWITH_ARCHIVE_STORAGE_ENGINE=1
			-DWITH_BLACKHOLE_STORAGE_ENGINE=1
			-DWITH_CSV_STORAGE_ENGINE=1
			-DWITH_HEAP_STORAGE_ENGINE=1
			-DWITH_INNOBASE_STORAGE_ENGINE=1
			-DWITH_MYISAMMRG_STORAGE_ENGINE=1
			-DWITH_MYISAM_STORAGE_ENGINE=1
			-DWITH_PARTITION_STORAGE_ENGINE=1
			-DWITH_INNODB_MEMCACHED=0
			-DWITH_NDBCLUSTER=1
			-DWITHOUT_PARTITION_STORAGE_ENGINE=0
		)

	else
		mycmakeargs+=(
			-DWITHOUT_SERVER=1
			-DWITH_EMBEDDED_SERVER=OFF
			-DEXTRA_CHARSETS=none
		)
	fi

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	# Kill old libmysqclient_r symlinks if they exist.  Time to fix what depends on them.
	find "${D%/}" -name 'libmysqlclient_r.*' -type l -delete || die
	# Make sure the vars are correctly initialized
	mysql_init_vars

	# Convenience links
	einfo "Making Convenience links for mysqlcheck multi-call binary"
	dosym "mysqlcheck" "/usr/bin/mysqlanalyze"
	dosym "mysqlcheck" "/usr/bin/mysqlrepair"
	dosym "mysqlcheck" "/usr/bin/mysqloptimize"

	# INSTALL_LAYOUT=STANDALONE causes cmake to create a /usr/data dir
	if [[ -d "${ED%/}/usr/data" ]] ; then
		find "${ED%/}/usr/data" -delete || die
	fi

	# Unless they explicitly specific USE=test, then do not install the
	# testsuite. It DOES have a use to be installed, esp. when you want to do a
	# validation of your database configuration after tuning it.
	if ! use test ; then
		find "${D%/}/${MY_SHAREDSTATEDIR}/mysql-test" -delete || die
	fi

	# Configuration stuff
	einfo "Building default configuration ..."
	insinto "${MY_SYSCONFDIR#${EPREFIX}}"
	[[ -f "${S%/}/scripts/mysqlaccess.conf" ]] && doins "${S%/}"/scripts/mysqlaccess.conf
	local mycnf_src="my.cnf-5.6"
	sed -e "s!@DATADIR@!${MY_DATADIR}!g" \
		"${FILESDIR%/}/${mycnf_src}" \
		> "${TMPDIR%/}/my.cnf.ok" || die
	use prefix && sed -i -r -e '/^user[[:space:]]*=[[:space:]]*mysql$/d' "${TMPDIR%/}/my.cnf.ok"
	if use latin1 ; then
		sed -i \
			-e "/character-set/s|utf8|latin1|g" \
			"${TMPDIR%/}/my.cnf.ok" || die
	fi
	eprefixify "${TMPDIR%/}/my.cnf.ok"
	newins "${TMPDIR}/my.cnf.ok" my.cnf

	if use server ; then
		einfo "Including support files and sample configurations"
		docinto "support-files"
		local script
		for script in \
			"${S}"/support-files/magic
		do
			[[ -f "$script" ]] && dodoc "${script}"
		done

		docinto "scripts"
		for script in "${S}"/scripts/mysql* ; do
			[[ ( -f "$script" ) && ( "${script%.sh}" == "${script}" ) ]] && dodoc "${script}"
		done
	fi
}

pkg_preinst() {
	java-utils-2_pkg_preinst
}

pkg_postinst() {
	# Make sure the vars are correctly initialized
	mysql_init_vars

	# Create log directory securely if it does not exist
	[[ -d "${ROOT}${MY_LOGDIR}" ]] || install -d -m0750 -o mysql -g mysql "${ROOT}${MY_LOGDIR}"

	if use server ; then
		if [[ -z "${REPLACING_VERSIONS}" ]] ; then
			einfo
			elog "You might want to run:"
			elog "\"emerge --config =${CATEGORY}/${PF}\""
			elog "if this is a new install."
			elog
			elog "If you are switching server implentations, you should run the"
			elog "mysql_upgrade tool."
			einfo
		else
			einfo
			elog "If you are upgrading major versions, you should run the"
			elog "mysql_upgrade tool."
			einfo
		fi
	fi
}

# Official test instructions:
# USE='extraengine perl openssl' \
# FEATURES='test userpriv -usersandbox' \
# ebuild mysql-cluster-X.X.XX.ebuild \
# digest clean package
src_test() {

	_disable_test() {
		local rawtestname reason
		rawtestname="${1}" ; shift
		reason="${@}"
		ewarn "test '${rawtestname}' disabled: '${reason}'"
		echo ${rawtestname} : ${reason} >> "${T}/disabled.def"
	}

	local TESTDIR="${CMAKE_BUILD_DIR}/mysql-test"
	local retstatus_unit
	local retstatus_tests

	# Bug #213475 - MySQL _will_ object strenously if your machine is named
	# localhost. Also causes weird failures.
	[[ "${HOSTNAME}" == "localhost" ]] && die "Your machine must NOT be named localhost"

	if use server ; then

		if [[ $UID -eq 0 ]]; then
			die "Testing with FEATURES=-userpriv is no longer supported by upstream. Tests MUST be run as non-root."
		fi
		has usersandbox $FEATURES && eerror "Some tests may fail with FEATURES=usersandbox"

		einfo ">>> Test phase [test]: ${CATEGORY}/${PF}"

		# Ensure that parallel runs don't die
		export MTR_BUILD_THREAD="$((${RANDOM} % 100))"
		# Enable parallel testing, auto will try to detect number of cores
		# You may set this by hand.
		# The default maximum is 8 unless MTR_MAX_PARALLEL is increased
		export MTR_PARALLEL="${MTR_PARALLEL:-auto}"

		# create directories because mysqladmin might right out of order
		mkdir -p "${T}"/var-tests{,/log}

		# create symlink for the tests to find mysql_tzinfo_to_sql
		ln -s "${BUILD_DIR}/sql/mysql_tzinfo_to_sql" "${S}/sql/"

		touch "${T}/disabled.def"
		# These are failing in MySQL 5.5/5.6 for now and are believed to be
		# false positives:
		#
		# main.information_schema, binlog.binlog_statement_insert_delayed,
		# main.mysqld--help-notwin, funcs_1.is_triggers funcs_1.is_tables_mysql,
		# funcs_1.is_columns_mysql, binlog.binlog_mysqlbinlog_filter,
		# perfschema.binlog_edge_mix, perfschema.binlog_edge_stmt,
		# mysqld--help-notwin, funcs_1.is_triggers, funcs_1.is_tables_mysql, funcs_1.is_columns_mysql
		# perfschema.binlog_edge_stmt, perfschema.binlog_edge_mix, binlog.binlog_mysqlbinlog_filter
		# fails due to USE=-latin1 / utf8 default
		#
		# main.mysql_client_test:
		# segfaults at random under Portage only, suspect resource limits.
		#
		for t in \
			binlog.binlog_mysqlbinlog_filter \
			binlog.binlog_statement_insert_delayed \
			funcs_1.is_columns_mysql \
			funcs_1.is_tables_mysql \
			funcs_1.is_triggers \
			main.information_schema \
			main.mysqld--help-notwinfuncs_1.is_triggers \
			main.mysql_client_test \
			mysqld--help-notwin \
			main.mysqlhotcopy_archive main.mysqlhotcopy_myisam \
			perfschema.binlog_edge_mix \
			perfschema.binlog_edge_stmt \
			rpl.rpl_plugin_load main.mysql \
			main.mysql_upgrade \
		; do
				_disable_test  "$t" "False positives in Gentoo"
		done
		# ndb.ndbinfo, ndb_binlog.ndb_binlog_index: latin1/utf8
		for t in \
			ndb.ndbinfo ndb.ndb_tools_connect \
			ndb_binlog.ndb_binlog_index ; do
				_disable_test  "$t" "False positives in Gentoo (NDB) (Latin1/UTF8)"
		done

		# Set file limits higher so tests run
		ulimit -n 3000

		# Run mysql tests
		pushd "${TESTDIR}" > /dev/null || die

		# run mysql-test tests
		perl mysql-test-run.pl --force --vardir="${T}/var-tests" \
			--suite-timeout=5000 --reorder --skip-test-list="${T}/disabled.def" \
			--nounit-tests
		retstatus_tests=$?

		popd > /dev/null || die

		# Cleanup is important for these testcases.
		pkill -9 -f "${S}/ndb" 2>/dev/null
		pkill -9 -f "${S}/sql" 2>/dev/null

		failures=""
		[[ $retstatus_unit -eq 0 ]] || failures="${failures} test-unit"
		[[ $retstatus_tests -eq 0 ]] || failures="${failures} tests"
		has usersandbox $FEATURES && eerror "Some tests may fail with FEATURES=usersandbox"

		[[ -z "$failures" ]] || die "Test failures: $failures"
		einfo "Tests successfully completed"

	else

		einfo "Skipping server tests due to minimal build."
	fi
}
