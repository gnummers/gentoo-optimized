# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils toolchain-funcs

DESCRIPTION="Weak signal communication software"
HOMEPAGE="http://physics.princeton.edu/pulsar/k1jt/index.html"
SRC_URI="mirror://sourceforge/wsjt/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc openmp"

CDEPEND="sci-libs/fftw:3.0[threads]
	>=media-libs/hamlib-3.1
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	dev-qt/qtserialport:5
	dev-qt/qtconcurrent:5"
DEPEND="${CDEPEND}
	doc? ( dev-ruby/asciidoctor )"
RDEPEND="${CDEPEND}"

CMAKE_USE_DIR="${S}/src/${PN}"

pkg_pretend() {
	if use openmp ; then
		tc-has-openmp || die "Please switch to an openmp compatible compiler"
	fi
}

src_unpack() {
	default
	cd "${S}"/src
	unpack ./${PN}.tgz
}

src_prepare() {
	cd "${S}"/src/${PN}
	epatch "${FILESDIR}"/${P}-hamlib-fixes.diff
	default
}

src_configure() {
	local mycmakeargs=(
		-DWSJT_GENERATE_DOCS="$(usex doc)"
	)

	cmake-utils_src_configure
}
