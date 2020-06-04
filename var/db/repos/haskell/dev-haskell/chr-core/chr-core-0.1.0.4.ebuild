# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Constraint Handling Rules"
HOMEPAGE="https://github.com/atzedijkstra/chr"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/chr-data-0.1.0.1:=[profile?]
	>=dev-haskell/chr-pretty-0.1.0.0:=[profile?]
	>=dev-haskell/hashable-1.2.4:=[profile?]
	>=dev-haskell/logict-state-0.1.0.5:=[profile?]
	>=dev-haskell/mtl-2:=[profile?]
	>=dev-haskell/pqueue-1.3.1:=[profile?]
	>=dev-haskell/unordered-containers-0.2.7:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
"