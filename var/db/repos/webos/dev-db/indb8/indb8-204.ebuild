EAPI="5"
inherit webos-cmake

DESCRIPTION="A userspace service that provides access to the Open webOS database"
HOMEPAGE="https://github.com/openwebos/db8"
SLOT="0"
IUSE="leveldb sandwich berkdb ls2 tests jsonobfucate"

KEYWORDS="x86 amd64"
LICENSE="Apache-2.0"

SRC_URI="https://github.com/feniksa/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/glib
		leveldb?  ( >=dev-libs/leveldb-1.14.0 )
		sandwich? ( >=dev-db/leveldb-tl-0.1.5 )
		berkdb?   ( >=sys-libs/db-4.8.30 )
		ls2?      ( >=sys-process/luna-service2-200.0 )
		tests?	  ( >=dev-cpp/gtest-1.7.0 )
		dev-libs/icu
		!!dev-db/db8"

RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
				$(cmake-utils_use_build ls2      	   LS2)
				$(cmake-utils_use_build tests    	   TESTING)
				$(cmake-utils_use_build leveldb  	   ENGINE_LEVELDB)
				$(cmake-utils_use_build sandwich 	   ENGINE_SANDWICH)
				$(cmake-utils_use_build berkdb   	   ENGINE_BERKELEY)
				$(cmake-utils_use_build jsonobfucate   TOOL_JSONOBFUSCATE)
				-DCMAKE_INSTALL_PREFIX="/"
                -DWITH_OPENRC=true
				-DWITH_CMAKE_MODULE=true
        )

        cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

    dodir /usr/share/indb8	
	dodir /var/db/main
	dodir /var/db/temp
}
