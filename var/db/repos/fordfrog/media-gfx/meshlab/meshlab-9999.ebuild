# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils desktop xdg git-r3

DESCRIPTION="the open source system for processing and editing 3D triangular meshes"
HOMEPAGE="http://www.meshlab.net"

GIT_REPO_MESHLAB="https://github.com/cnr-isti-vclab/meshlab.git"
GIT_REPO_VCGLIB="https://github.com/cnr-isti-vclab/vcglib.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="-minimal"
DEPEND="
	app-arch/bzip2
	dev-cpp/eigen:3
	dev-cpp/muParser
	dev-qt/qtcore:5
	dev-qt/qtopengl:5
	dev-qt/qtscript:5
	dev-qt/qtxmlpatterns:5
	>=media-gfx/jhead-3.00-r2
	media-libs/glew:0
	media-libs/qhull
	=media-libs/lib3ds-1*
	media-libs/openctm
	sci-libs/levmar
	sci-libs/mpir"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}/src"

PATCHES=(
	"${FILESDIR}"/${P}-disable-bundled-libs.patch
)

src_unpack() {
	git-r3_fetch ${GIT_REPO_MESHLAB} refs/heads/master
	git-r3_checkout ${GIT_REPO_MESHLAB} "${WORKDIR}/${PN}"

	git-r3_fetch ${GIT_REPO_VCGLIB} refs/heads/devel
	git-r3_checkout ${GIT_REPO_VCGLIB} "${WORKDIR}/vcglib"
}

src_prepare(){
	default

	rm -r "distrib/plugins/U3D_W32" || die
	rm -r "distrib/plugins/U3D_OSX" || die

	# Fix libssynth.a not being found
	einfo "Fixing libssynth.a path"
	mkdir pf "${S}"/external/lib/linux-g++/ || die "Failed to create target dir"
	ln -s "${S}"/external/lib/macx64/libssynth.a "${S}"/external/lib/linux-g++/ || die "Failed to create workaround symlink"
}

src_configure() {
	local qmake_flags=(
		'CONFIG+=system_eigen3'
		'CONFIG+=system_glew'
		'CONFIG+=system_lib3ds'
		'CONFIG+=system_openctm'
		'CONFIG+=system_bzip2'
	)

	eqmake5 -r external/external.pro ${qmake_flags}
	eqmake5 -r meshlab_$(use minimal && echo minimal || echo full).pro ${qmake_flags}
}

src_install() {
	dobin distrib/{meshlab,meshlabserver}
	dolib.so distrib/libcommon.so.1.0.0
	dosym libcommon.so.1.0.0 /usr/$(get_libdir)/libcommon.so.1
	dosym libcommon.so.1 /usr/$(get_libdir)/libcommon.so
	exeinto /usr/$(get_libdir)/meshlab/plugins
	doexe distrib/plugins/*.so
	insinto /usr/share/meshlab/shaders
	doins -r distrib/shaders/*
	insinto /usr/share/meshlab/plugins
	doins -r distrib/plugins/*
	insinto /usr/share/meshlab/textures
	doins -r distrib/textures/*
	insinto /usr/share/meshlab/sample
	doins -r distrib/sample/*
	newicon "${S}"/meshlab/images/eye512.png "${PN}".png
	make_desktop_entry meshlab "Meshlab" "${PN}" Graphics
}
