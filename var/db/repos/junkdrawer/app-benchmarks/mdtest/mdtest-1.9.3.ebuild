# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="an MPI-coordinated metadata benchmark"
HOMEPAGE="https://sourceforge.net/projects/mdtest"
SRC_URI="mirror://sourceforge/${PN}/${PN}%20latest/${P}/${P}.tgz"

LICENSE="mdtest"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile() {
	emake MPI_CC=mpicc
}

src_install() {
	dobin mdtest
	doman mdtest.1
}
