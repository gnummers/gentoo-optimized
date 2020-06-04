# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # Broken: test-suite
inherit haskell-cabal

DESCRIPTION="Bindings to the ICU library"
HOMEPAGE="https://github.com/bos/text-icu"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # QuickCheck occasionally finds counterexamples
# and fails to build: Duplicate instance declarations: instance NFData Ordering

RDEPEND=">=dev-haskell/text-0.9.1.0:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	dev-libs/icu:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"