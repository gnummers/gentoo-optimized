# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit fortran-2 multilib toolchain-funcs

DESCRIPTION="a general purpose molecular dynamics simulation package"
HOMEPAGE="http://www.ccp5.ac.uk/DL_POLY/"
SRC_URI="dl_poly_4.05.tar.gz"

LICENSE="STFC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
RESTRICT="fetch"

DEPEND="virtual/mpi[fortran]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P//-/_}/source"

pkg_nofetch() {
	einfo "Go to ${HOMEPAGE} and download ${A}"
	einfo "into ${DISTDIR}"
}

src_prepare() {
	cp ../build/Makefile_MPI Makefile || die
}

src_compile() {
	emake -j1 FC="mpif77 -c" FCFLAGS="${FFLAGS}" LD="mpif77 -o" LDFLAGS="${LDFLAGS}" EXE="${PN}" master
}

src_install() {
	newbin "${PN}" DLPOLY.Z
	use doc && dodoc ../manual/USRMAN*.pdf
}
