# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils subversion toolchain-funcs

DESCRIPTION="Weak signal communication software"
HOMEPAGE="http://physics.princeton.edu/pulsar/k1jt/index.html"

ESVN_REPO_URI="http://svn.code.sf.net/p/wsjt/wsjt/branches/wsjtx"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="doc openmp"

CDEPEND="sci-libs/fftw:3.0[threads]
	>=media-libs/hamlib-3.1
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	dev-qt/qtprintsupport:5
	dev-qt/qtserialport:5
	dev-qt/qtconcurrent:5"
DEPEND="${CDEPEND}
	doc? ( dev-ruby/asciidoctor )"
RDEPEND="${CDEPEND}"

pkg_pretend() {
	if use openmp ; then
		tc-has-openmp || die "Please switch to an openmp compatible compiler"
	fi
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.8.0_rc1-hamlib-fixes.diff"
	default
}

src_configure() {
	local mycmakeargs=(
		-DWSJT_GENERATE_DOCS="$(usex doc)"
		-DWSJT_DOC_DESTINATION="/doc/${PF}"
	)

	cmake-utils_src_configure
}
