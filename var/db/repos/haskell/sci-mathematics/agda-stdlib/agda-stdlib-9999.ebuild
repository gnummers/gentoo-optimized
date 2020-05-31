# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CABAL_FEATURES="bin"
inherit haskell-cabal elisp-common git-r3

DESCRIPTION="Agda standard library"
HOMEPAGE="http://wiki.portal.chalmers.se/agda/"
EGIT_REPO_URI="https://github.com/agda/agda-stdlib.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="profile +ffi test"

RDEPEND="=sci-mathematics/agda-9999*:=[profile?]
	ffi? ( sci-mathematics/agda-lib-ffi )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
	=dev-haskell/filemanip-0.3*[profile?]
	>=dev-lang/ghc-6.12.1
"

src_prepare() {
	cabal-mksetup
}

src_compile() {
	haskell-cabal_src_compile
	"${S}"/dist/build/GenerateEverything/GenerateEverything \
		|| die "GenerateEverything failed"

	# Run Everything.agda which imports all generated modules.
	local prof
	use profile && prof="--ghc-flag=-prof"
	agda +RTS -K1G -RTS ${prof} -i. -isrc Everything.agda \
		|| die "failed loading generated modules"

	# Generate the documentation.
	agda --html -i. -isrc README.agda \
		|| die "failed to generate html docs"
}

src_test() {
	# The makefile has a "test" target, but it won't run if you don't
	# use the makefile to build the library (we don't). We just steal
	# the command from `make test`.
	einfo ">>> Test phase [test]: ${CATEGORY}/${PF}"
	agda -i. -isrc README.agda \
		|| die "Test suite failed. See above for details."
}

src_install() {
	insinto usr/share/agda-stdlib
	export INSOPTIONS=--preserve-timestamps
	doins -r src/*
	dodoc -r html/*
	doins "${FILESDIR}/standard-library.agda-lib"
}
