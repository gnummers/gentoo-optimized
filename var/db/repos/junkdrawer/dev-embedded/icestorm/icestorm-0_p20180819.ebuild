# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit eutils python-any-r1 toolchain-funcs

DESCRIPTION="IceStorm - tools for analyzing and creating bitstreams for Lattice iCE40 FPGAs"
HOMEPAGE="http://www.clifford.at/icestorm/"
LICENSE="ISC"
if [ ${PV} == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cliffordwolf/icestorm.git"
else
	EGIT_COMMIT="c02a4000f4cef8d4d9e76757f55ea4920667e1e8"
	SRC_URI="https://github.com/cliffordwolf/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

SLOT="0"
IUSE="ftdi"

RDEPEND="ftdi? ( dev-embedded/libftdi:= )"
DEPEND="
		${PYTHON_DEPS}
		virtual/pkgconfig
		${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-9999-prefix.patch
	epatch "${FILESDIR}"/${PN}-9999-flags.patch
	epatch "${FILESDIR}"/${PN}-9999-ftdi-fix.patch
	if ! use ftdi; then
		epatch "${FILESDIR}"/${PN}-9999-no-iceprog.patch
	fi

	eapply_user
}

src_compile() {
	export PREFIX=/usr
	emake CC=$(tc-getCC) CXX=$(tc-getCXX) CFLAGS="$CFLAGS"
}
