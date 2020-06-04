# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.7

CABAL_FEATURES="bin"
inherit haskell-cabal games

DESCRIPTION="A game of competitive puzzle-design"
HOMEPAGE="http://mbays.freeshell.org/intricacy"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+curses +sdl +sound -server"

REQUIRED_USE="|| ( curses sdl )"

RDEPEND=">=dev-lang/ghc-7.6.1:=
	curses? ( >=dev-haskell/hscurses-1.4:= )
	>=dev-haskell/binary-0.5:=
	>=dev-haskell/cryptohash-0.8:=
	>=dev-haskell/mtl-2.2:=
	>=dev-haskell/network-fancy-0.1.5:=
	>=dev-haskell/safe-0.2:=
	>=dev-haskell/stm-2.1:=
	>=dev-haskell/transformers-0.4:=
	>=dev-haskell/vector-0.9:=
	sdl? ( >=dev-haskell/sdl-0.6.5:=
		>=dev-haskell/sdl-gfx-0.6:=
		>=dev-haskell/sdl-ttf-0.6:=
		sound? ( >=dev-haskell/random-1.0:=
			>=dev-haskell/sdl-mixer-0.6:= ) )
	server? ( >=dev-haskell/random-1.0:=
		>=dev-haskell/pipes-4:=
		>=dev-haskell/feed-0.3.1:=
		>=dev-haskell/xml-1.2.6:=
		>=dev-haskell/email-validate-1.0.0:=
		dev-haskell/text
		>=dev-haskell/smtp-mail-0.1.4.1:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

pkg_setup() {
	games_pkg_setup
	haskell-cabal_pkg_setup
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag curses curses) \
		$(cabal_flag sdl sdl) \
		$(cabal_flag sound sound) \
		$(cabal_flag server server) \
		--prefix="${GAMES_PREFIX}"
}

src_compile() {
	haskell-cabal_src_compile
}

src_install() {
	haskell-cabal_src_install
	prepgamesdirs
}

pkg_postinst() {
	haskell-cabal_pkg_postinst
	games_pkg_postinst
}