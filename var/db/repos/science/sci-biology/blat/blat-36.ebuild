# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils toolchain-funcs

MY_PN="${PN}Src"

DESCRIPTION="The BLAST-Like Alignment Tool, a fast genomic sequence aligner"
HOMEPAGE="http://www.cse.ucsc.edu/~kent/"
SRC_URI="http://hgwdev.cse.ucsc.edu/~kent/src/${MY_PN}${PV}.zip"

SLOT="0"
LICENSE="blat"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_PN}"

DEPEND="
	app-arch/unzip
	virtual/mysql
	virtual/libmysqlclient"
RDEPEND=""

src_prepare() {
	eapply_user
	epatch "${FILESDIR}"/${PV}-gentoo.patch
	sed \
		-e "1i\CFLAGS=${CFLAGS}" \
		-e "1i\LDFLAGS=${LDFLAGS}" \
		-i inc/common.mk || die
	tc-export CC
}

src_compile() {
	MACHTYPE=$(tc-arch)
	[[ ${MACHTYPE} == "x86" ]] && MACHTYPE="i386"
	mkdir -p "${S}/bin/${MACHTYPE}"
	emake MACHTYPE="${MACHTYPE}" HOME="${S}" LDFLAGS="${LDFLAGS}"
}

src_install() {
	MACHTYPE=$(tc-arch)
	[[ ${MACHTYPE} == "x86" ]] && MACHTYPE="i386"
	dobin "${S}/bin/${MACHTYPE}/"*
}
