EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="Palm's Better Native JSON library"
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS="~x86 ~amd64 ~arm"
LICENSE="Apache-2.0"
IUSE="nolog"

# boost required for executable which never installed, but always compiled
DEPEND="
	>=dev-util/cmake-modules-webos-21
	dev-libs/lemon
	sys-devel/flex
	dev-libs/boost
"
RDEPEND="
	>=dev-libs/glib-2.30
	dev-libs/gmp
	dev-libs/uriparser
	dev-libs/yajl
	!nolog? ( dev-libs/pmloglib )
"

RESTRICT="fetch"

src_configure() {
	local mycmakeargs+=(
		$(cmake-utils_use nolog NO_LOGGING)
	)
	webos-cmake_src_configure
}
