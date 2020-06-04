# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Library exposing some functionality of Haddock"
HOMEPAGE="http://www.haskell.org/haddock/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
# keep in sync with ghc-8.4.2, might not be required but needs porting revdeps
#KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-haskell/fail-4.9.0.0:=[profile?] <dev-haskell/fail-4.10:=[profile?]
	>=dev-haskell/semigroups-0.18.3:=[profile?] <dev-haskell/semigroups-0.19:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.0
	test? ( >=dev-haskell/base-compat-0.9.3 <dev-haskell/base-compat-0.10
		>=dev-haskell/hspec-2.4.4 <dev-haskell/hspec-2.5
		>=dev-haskell/optparse-applicative-0.14.0.0 <dev-haskell/optparse-applicative-0.15
		>=dev-haskell/quickcheck-2.11 <dev-haskell/quickcheck-2.12
		>=dev-haskell/tree-diff-0.0.0.1 <dev-haskell/tree-diff-0.1 )
"