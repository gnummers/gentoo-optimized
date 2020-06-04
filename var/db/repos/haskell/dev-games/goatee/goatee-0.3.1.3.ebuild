# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A monadic take on a 2,500-year-old board game - library"
HOMEPAGE="http://khumba.net/projects/goatee"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/parsec-3.1:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hunit-1.2 <dev-haskell/hunit-1.7 )
"

src_prepare() {
	default

	cabal_chdeps \
		'containers >= 0.4 && < 0.6' 'containers >= 0.4' \
		'template-haskell >= 2.7 && < 2.14' 'template-haskell >= 2.7'
}