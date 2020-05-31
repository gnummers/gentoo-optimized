# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit  eutils  cmake-utils python-single-r1 multilib

PYVER="2.7"

DESCRIPTION="GDCM is an implementation of the DICOM standard."
HOMEPAGE="http://gdcm.sourceforge.net/"
SRC_URI="mirror://sourceforge/gdcm/${P}.tar.bz2"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc vtk python"

RDEPEND="vtk? ( >=sci-libs/vtk-6.3 )
	app-text/poppler
	dev-libs/libxml2
	dev-libs/expat
	dev-libs/json-c
	dev-libs/openssl:0
	media-libs/openjpeg:2
	media-libs/charls
	sys-libs/zlib
	"

DEPEND="app-arch/xz-utils
	doc? ( app-doc/doxygen )
	app-text/docbook-xsl-ns-stylesheets
	dev-libs/libxslt
	python? ( ${PYTHON_DEPS}
			  >=dev-lang/swig-3.0
			  >=sci-libs/vtk-6.3[python]
	)
	${RDEPEND}
"

PATCHES=(
	"${FILESDIR}/gdcm-fix-xslt-maxdepth.patch"
	"${FILESDIR}/unforce_cxx98.patch"
)

src_configure() {
	append-cxxflags -std=c++11
	local mycmakeargs=(
		-DGDCM_DOXYGEN_NO_FOOTER:BOOL=ON \
		-DGDCM_BUILD_APPLICATIONS:BOOL=ON \
		-DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
		-DGDCM_USE_PVRG:BOOL=ON \
		-DGDCM_USE_SYSTEM_PVRG:BOOL=OFF \
		-DGDCM_BUILD_TESTING:BOOL=OFF \
		-DGDCM_USE_SYSTEM_EXPAT:BOOL=ON \
		-DGDCM_USE_SYSTEM_UUID:BOOL=ON \
		-DGDCM_USE_SYSTEM_ZLIB:BOOL=ON \
		-DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
		-DGDCM_USE_SYSTEM_OPENSSL:BOOL=ON \
		-DGDCM_USE_SYSTEM_CHARLS:BOOL=ON \
		-DGDCM_USE_SYSTEM_POPPLER:BOOL=ON \
		-DGDCM_USE_SYSTEM_LIBXML2:BOOL=ON \
		-DGDCM_USE_SYSTEM_JSON:BOOL=ON \
		-DGDCM_USE_PARAVIEW:BOOL=OFF \
		-DGDCM_USE_ACTIVIZ:BOOL=OFF \
		-DGDCM_USE_SYSTEM_PAPYRUS3:BOOL=OFF \
		-DGDCM_USE_SYSTEM_SOCKETXX:BOOL=OFF \
		-DGDCM_INSTALL_LIB_DIR:STRING=$(get_libdir)
	)

	if use vtk; then
		mycmakeargs+=(
			-DGDCM_USE_VTK:BOOL=ON
		)
	fi
	if use python; then
		mycmakeargs+=(
			-DPython_ADDITIONAL_VERSIONS:STRING=${PYVER}
			-DGDCM_INSTALL_PYTHONMODULE_DIR:STRING=lib/python${PYVER}/site-packages
			-DGDCM_WRAP_PYTHON:BOOL=ON
		)
	fi

	if use doc; then
		mycmakeargs+=(
			-DGDCM_DOCUMENTATION:BOOL=ON
		)
	fi

	cmake-utils_src_configure
}
