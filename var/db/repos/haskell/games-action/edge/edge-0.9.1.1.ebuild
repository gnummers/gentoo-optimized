# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Top view space combat arcade game"
HOMEPAGE="https://qlfiles.net/the-ql-files/the-edge/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/alut-2.3:=
	>=dev-haskell/cmdtheline-0.2.1.1:= <dev-haskell/cmdtheline-0.3:=
	>=dev-haskell/gloss-1.9:=
	>=dev-haskell/gloss-rendering-1.9:=
	>=dev-haskell/openal-1.4.0.2:=
	>=dev-haskell/random-1.0.1.1:=
	>=dev-haskell/wraparound-0.0.2:= <dev-haskell/wraparound-0.1:=
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

PATCHES=(
	"${FILESDIR}"/${PN}-0.9.0.2-ghc-7.10.patch
	"${FILESDIR}"/${PN}-0.9.1.1-alut-2.3.patch
	"${FILESDIR}"/${PN}-0.9.1.1-gloss-1.9.patch
	"${FILESDIR}"/${PN}-0.9.1.1-gloss-1.11.patch
)

src_prepare() {
	default

	cabal_chdeps \
		'ALUT >= 2.2 && < 2.3' 'ALUT >= 2.3' \
		'random >= 1.0.1.1 && < 1.1' 'random >= 1.0.1.1' \
		'OpenAL == 1.4.0.2' 'OpenAL >= 1.4.0.2' \
		'gloss >= 1.7.4.1 && < 1.9' 'gloss >= 1.9, gloss-rendering >= 1.9'
}