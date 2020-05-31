EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="A userspace service that provides access to the openWebOS database"
HOMEPAGE="https://github.com/openwebos/db8"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"
IUSE="tests"

DEPEND="dev-db/leveldb-tl
		dev-libs/glib
		dev-libs/pmloglib
		dev-libs/libpbnjson
		sys-process/luna-service2
		!!dev-db/indb8"

src_configure() {
	mycmakeargs+=(
		$(cmake-utils_use tests WEBOS_CONFIG_BUILD_TESTS)
	)

	webos-cmake_src_configure
}

src_install() {
	cmake-utils_src_install

	rm -r "${D}"/etc/event.d || die "Can't remove event.d dir, please, recheck ebuild"
	rm -r "${D}"/etc/init || die "Can't remove init dir, please, recheck ebuild"
	rm -f "${D}"/usr/lib64/db8/tests/dbgen || die "db8 doesn't provide dbgen, please, recheck ebuild"
	rm -f "${D}"/etc/palm/db8/mediadb.conf || die "db8 doesn't provide mediadb.conf, recheck ebuild"

	dodir /var/db/main
	dodir /var/db/temp

	newinitd "${FILESDIR}/db8-maindb" db8-maindb
	newinitd "${FILESDIR}/db8-tempdb" db8-tempdb

}
