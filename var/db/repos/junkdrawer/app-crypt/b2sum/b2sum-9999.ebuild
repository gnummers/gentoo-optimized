# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="tool to create BLAKE2 hashes of files or streams"
HOMEPAGE="https://blake2.net/"
if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/BLAKE2/BLAKE2"
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="|| ( CC0-1.0 openssl Apache-2.0 )"
SLOT="0"
IUSE="openmp"

DEPEND="<sys-apps/coreutils-8.26"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/${PN}"

# TODO: check openmp support

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_compile() {
	emake NO_OPENMP=$(usex openmp 0 1)
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" MANDIR="/usr/share/man" install
	einstalldocs
}
