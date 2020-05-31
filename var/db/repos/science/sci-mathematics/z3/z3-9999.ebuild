# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit autotools flag-o-matic git-r3 python-r1 toolchain-funcs

DESCRIPTION="An efficient theorem prover"
HOMEPAGE="http://z3.codeplex.com/"
SRC_URI=""
EGIT_REPO_URI="https://git01.codeplex.com/z3"
EGIT_MIN_CLONE_TYPE=single

SLOT="0"
LICENSE="MIT"
KEYWORDS=""
IUSE="gmp"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	gmp? ( dev-libs/gmp:0 )"
# A new curl is needed because codeplex has a bug and early version of libcurl
# will cause a failed git clone.
DEPEND="${RDEPEND}
	>=net-misc/curl-7.33"

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		if [[ $(tc-getCXX)$ == *g++* ]] && ! tc-has-openmp; then
			ewarn "Please use an openmp compatible compiler"
			ewarn "like >gcc-4.2 with USE=openmp"
			die "Openmp support missing in compiler"
		fi
	fi
}

src_prepare() {
	sed \
		-e 's:-O3::g' \
		-e 's:-fomit-frame-pointer::' \
		-e 's:-msse2::g' \
		-e 's:-msse::g' \
		-e "/LINK_EXTRA_FLAGS/s:@LDFLAGS@:-lrt $(usex gmp -lgmp):g" \
		-e 's:t@\$:t\$:g' \
		-i scripts/*mk* || die

	append-ldflags -fopenmp

	eautoreconf
}

src_configure() {
	python_export_best
	econf \
		--host="" \
		--with-python="${PYTHON}" \
		$(use_with gmp) \
		SLIBFLAGS=" -Wl,-soname,lib${PN}.so.0.1 "
	${EPYTHON} scripts/mk_make.py || die
}

src_compile() {
	emake \
		--directory="build" \
		CXX=$(tc-getCXX) \
		LINK="$(tc-getCXX) ${LDFLAGS}" \
		LINK_FLAGS="${LDFLAGS}"
}

src_install() {
	doheader src/api/z3*.h src/api/c++/z3*.h
	dolib.so build/*.so
	dobin build/z3

	python_foreach_impl python_domodule src/api/python/*.py
}
