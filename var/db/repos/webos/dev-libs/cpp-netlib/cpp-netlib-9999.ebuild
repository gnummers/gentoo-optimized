EAPI="5"

inherit cmake-utils git-r3

DESCRIPTION="A collection of open-source libraries for high level network programming.."
HOMEPAGE="http://cpp-netlib.github.com"

EGIT_REPO_URI="https://github.com/cpp-netlib/cpp-netlib.git"
EGIT_BRANCH="master"
EGIT_COMMIT="769e5c65a27bf1928c8bf94ff4a7680444787ee7"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="dev-libs/boost dev-cpp/gtest"
RDEPEND="${DEPEND}"

#S="${WORKDIR}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		 $(cmake-utils_use test CPP-NETLIB_BUILD_TESTS )
		 $(cmake-utils_use examples CPP-NETLIB_BUILD_EXAMPLES )

	)
	cmake-utils_src_configure
}
