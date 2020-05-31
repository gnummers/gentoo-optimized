# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils

DESCRIPTION="DICOM for VTK tools"
HOMEPAGE="https://github.com/dgobbi/vtk-dicom"
SRC_URI="https://github.com/dgobbi/vtk-dicom/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=sci-libs/vtk-6.2
		sci-libs/gdcm
		"
DEPEND="${RDEPEND}
		  >=dev-util/cmake-2.8
	"
src_configure() {

	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=OFF \
		-DBUILD_JAVA_WRAPPERS:BOOL=OFF \
		-DUSE_DCMTK:BOOL=OFF \
		-DUSE_GDCM:BOOL=ON \
		-DBUILD_SHARED_LIBS:BOOL=ON
	)
	cmake-utils_src_configure
}
