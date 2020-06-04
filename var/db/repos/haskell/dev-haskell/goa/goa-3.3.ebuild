# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="GHCi bindings to lambdabot"
HOMEPAGE="http://hackage.haskell.org/package/goa"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.4:=
	dev-haskell/lambdabot
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

src_prepare() {
	epatch "${FILESDIR}/${PN}-3.1-haddock.patch"
	sed -e 's@setLambdabotHome "/home/dons/lambdabot"@setLambdabotHome "/usr/bin"@' -i "${S}/dot-ghci"
	sed -e 's@import qualified Control.Exception as C@import qualified Control.OldException as C@' -i "${S}/GOA.hs"
}

pkg_postinst() {
	haskell-cabal_pkg_postinst

	DOT_GHCI=$(equery files dev-haskell/goa | grep dot-ghci)
	elog "To configure a trippin' ghci, add $DOT_GHCI to your ~/.ghci"
}