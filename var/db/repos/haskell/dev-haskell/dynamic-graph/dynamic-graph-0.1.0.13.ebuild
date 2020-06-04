# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Draw and update graphs in real time with OpenGL"
HOMEPAGE="https://github.com/adamwalker/dynamic-graph"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cairo-0.13:=[profile?] <dev-haskell/cairo-0.14:=[profile?]
	>=dev-haskell/colour-2.3:=[profile?] <dev-haskell/colour-2.4:=[profile?]
	>=dev-haskell/glfw-b-1.4:=[profile?] <dev-haskell/glfw-b-4:=[profile?]
	>=dev-haskell/glutil-0.9.1:=[profile?] <dev-haskell/glutil-0.11:=[profile?]
	>=dev-haskell/opengl-2.9:=[profile?] <dev-haskell/opengl-3.1:=[profile?]
	>=dev-haskell/pango-0.13:=[profile?] <dev-haskell/pango-0.14:=[profile?]
	>=dev-haskell/pipes-4.1:=[profile?] <dev-haskell/pipes-4.4:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"