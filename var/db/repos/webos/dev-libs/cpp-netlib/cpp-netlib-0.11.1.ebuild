EAPI="5"

inherit cmake-utils

DESCRIPTION="A collection of open-source libraries for high level network programming.."
HOMEPAGE="http://cpp-netlib.github.com/"
SRC_URI="http://storage.googleapis.com/cpp-netlib-downloads/${PV}/${P}-final.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-final"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		 $(cmake-utils_use test CPP-NETLIB_BUILD_TESTS )
		 $(cmake-utils_use examples CPP-NETLIB_BUILD_EXAMPLES )

	)
	cmake-utils_src_configure
}

#src_install() {
#	# emake DESTDIR="${D}" install || die "install failed"
#	mkdir -p "${D}"/usr/include/boost
#	cp -r boost/* "${D}"/usr/include/boost/
#	mkdir -p "${D}"/usr/lib64
#	cp ${CMAKE_BUILD_DIR}/libs/network/src/*.so "${D}"/usr/lib64/
#}
