EAPI=5

inherit cmake-utils webos-github

DESCRIPTION="CMake modules needed to build Open webOS components"
HOMEPAGE="https://github.com/openwebos/cmake-modules-webos"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND="dev-util/cmake"

PATCHES=( "${FILESDIR}/0001-Remove-GTEST-macro-check.patch" )

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/"
		"-DWEBOS_INSTALL_ROOT:PATH=/"
		"-DWEBOS_INSTALL_LIBDIR:PATH=/usr/lib/"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}
