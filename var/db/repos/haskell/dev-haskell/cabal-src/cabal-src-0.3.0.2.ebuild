# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES=""
inherit haskell-cabal

DESCRIPTION="Alternative install procedure to avoid the diamond dependency issue"
HOMEPAGE="https://github.com/yesodweb/cabal-src"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/conduit-1.1:=
	dev-haskell/conduit-extra:=
	>=dev-haskell/http-conduit-1.5:=
	dev-haskell/http-types:=
	dev-haskell/network:=
	dev-haskell/resourcet:=
	>=dev-haskell/shelly-1.3.1:=
	>=dev-haskell/system-fileio-0.3:= <dev-haskell/system-fileio-0.4:=
	>=dev-haskell/system-filepath-0.4:= <dev-haskell/system-filepath-0.5:=
	>=dev-haskell/tar-0.4:= <dev-haskell/tar-0.6:=
	dev-haskell/text:=
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"