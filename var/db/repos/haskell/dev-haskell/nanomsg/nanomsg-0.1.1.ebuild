# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="nanomsg - scalability protocols library"
HOMEPAGE="http://hackage.haskell.org/package/nanomsg"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.6.1:=
	dev-libs/nanomsg
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

src_prepare() {
	cabal_chdeps \
		'base       == 4.6.*' 'base       >= 4.6'
}