EAPI="5"
inherit webos-cmake

DESCRIPTION="A userspace service that provides access to the Open webOS database"
HOMEPAGE="https://github.com/openwebos/db8"
SLOT="0"
IUSE="leveldb sandwich berkdb ls2 test"

KEYWORDS="amd64"
LICENSE="Apache-2.0"

SRC_URI="https://github.com/feniksa/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
KEYWORDS="amd64"
S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/glib
		leveldb?  ( >=dev-libs/leveldb-1.14.0 )
		sandwich? ( >=dev-db/leveldb-tl-0.1.5 )
		berkdb?   ( >=sys-libs/db-4.8.30 )
		ls2?      ( >=sys-process/luna-service2-200.0 )
		test?	  ( >=dev-cpp/gtest-1.7.0 )
		dev-libs/icu
		!!dev-db/db8"

RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
				$(cmake-utils_use_build ls2      LS2)
				$(cmake-utils_use_build test     TESTING)
				$(cmake-utils_use_build leveldb  ENGINE_LEVELDB)
				$(cmake-utils_use_build sandwich ENGINE_SANDWICH)
				$(cmake-utils_use_build berkdb   ENGINE_BERKELEY)
        )

        cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	
	dodir /var/db/main
	dodir /var/db/temp
	newinitd "${FILESDIR}/indb8-maindb" indb8-maindb
	newinitd "${FILESDIR}/indb8-tempdb" indb8-tempdb
}
