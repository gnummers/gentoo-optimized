# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Hoodle file renderer"
HOMEPAGE="http://hackage.haskell.org/package/hoodle-render"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base64-bytestring-0.1:=[profile?]
	>=dev-haskell/cairo-0.13.0.3:=[profile?]
	>=dev-haskell/gd-3000.7:=[profile?,jpeg,png]
	>=dev-haskell/gtk3-0.14:=[profile?]
	dev-haskell/hashable:=[profile?]
	>=dev-haskell/hoodle-types-0.4:=[profile?]
	>=dev-haskell/lens-2.5:=[profile?]
	>=dev-haskell/monad-loops-0.3:=[profile?]
	>dev-haskell/mtl-2:=[profile?]
	>=dev-haskell/poppler-0.14:=[profile?]
	dev-haskell/stm:=[profile?]
	>=dev-haskell/strict-0.3:=[profile?]
	>=dev-haskell/svgcairo-0.12:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-haskell/uuid-1.2:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"