# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit eutils haskell-cabal

MY_PN="EitherT"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="EitherT monad transformer"
HOMEPAGE="http://hackage.haskell.org/package/EitherT"
SRC_URI="https://hackage.haskell.org/package/${MY_P}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/monad-control-0.3:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?]
	>=dev-haskell/transformers-base-0.4:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}"/${P}-monad-control-1.0.patch
	"${FILESDIR}"/${P}-ghc84.patch
)