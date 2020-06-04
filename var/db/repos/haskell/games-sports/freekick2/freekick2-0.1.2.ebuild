# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="bin"
inherit eutils haskell-cabal

DESCRIPTION="A soccer game"
HOMEPAGE="https://github.com/anttisalonen/freekick2"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-haskell/binary-0.5.0.0
	>=dev-haskell/cabal-1.8.0.2
	>=dev-haskell/edisoncore-1.2.1.0
	>=dev-haskell/ftgl-1.333
	>=dev-haskell/mtl-1.1.0.0
	>=dev-haskell/opengl-2.1.0.0
	>=dev-haskell/pngload-0.1
	>=dev-haskell/random-1.0.0.0
	>=dev-haskell/sdl-0.5.5
	>=dev-lang/ghc-6.12.1
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-opengl-2.9.patch
	epatch "${FILESDIR}"/${P}-ghc-7.10.patch
	epatch "${FILESDIR}"/${P}-ghc-8.patch

	cabal_chdeps \
		'base > 3 && < 5, haskell98' 'base > 3 && < 5'
}