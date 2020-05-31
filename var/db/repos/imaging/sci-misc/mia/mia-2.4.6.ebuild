# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit  cmake-utils

DESCRIPTION="Library and tools for medical image processing"
HOMEPAGE="http://mia.sf.net/"
SRC_URI="mirror://sourceforge/mia/${P}.tar.xz"
RESTRICT="primaryuri"

IUSE="doc itpp +gts tbb +vtk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="dev-cpp/eigen
	  dev-libs/libxml2
	  tbb? ( dev-cpp/tbb )
	  !tbb? ( >=sys-devel/gcc-6.0:* )
	  dev-libs/boost
	  sci-libs/fftw:3.0
	  sci-libs/gsl
	  gts? ( sci-libs/gts )
	  media-libs/libpng:=
	  media-libs/openexr
	  media-libs/tiff:0
	  sci-libs/dcmtk
	  sci-libs/gts
	  sci-libs/hdf5
	  itpp? ( sci-libs/itpp )
	  sci-libs/maxflow
	  sci-libs/nifticlib
	  sci-libs/nlopt
	  vtk? ( sci-libs/vtk )
	  virtual/blas
	  virtual/jpeg:62
	"

DEPEND="app-arch/xz-utils
	dev-python/lxml
	doc? (
	       app-doc/doxygen[dot,latex]
	       media-gfx/graphviz
	       dev-libs/libxslt
	     )
	${RDEPEND}
	"

src_configure() {
	local mycmakeargs=(
		-DSTRICT_DEPENDECIES=TRUE
		-DMIA_CREATE_MANPAGES=ON
		-DMIA_CREATE_NIPYPE_INTERFACES=ON
		-DALWAYS_CREATE_DOC=$(usex doc)
		-DWITH_GTS=$(usex gts)
		-DWITH_ITPP=$(usex itpp)
		-DWITH_TBB=$(usex tbb)
		-DWITH_VTKIO=$(usex vtk)
	)

	cmake-utils_src_configure
}
