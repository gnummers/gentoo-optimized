# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.4.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour" # Broken test-suite: needs an update
inherit haskell-cabal

DESCRIPTION="Haskell implementation of Mustache templates"
HOMEPAGE="https://github.com/lymar/hastache"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # fails to build with ghc-7.10: Non type-variable argument

RDEPEND="dev-haskell/blaze-builder:=[profile?]
	dev-haskell/ieee754:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/transformers:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"

PATCHES=("${FILESDIR}"/${P}-ghc-8.4.patch)