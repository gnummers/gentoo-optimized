# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.4.9999
#hackport: flags: pango:gtk,-scion

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="The Haskell-Scriptable Editor"
HOMEPAGE="http://haskell.org/haskellwiki/Yi"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="eventlog gtk profiling +testing +vty"

RDEPEND=">=dev-haskell/binary-0.5:=[profile?]
	>=dev-haskell/cabal-1.10:=[profile?]
	>=dev-haskell/cautious-file-1.0.1:=[profile?]
	dev-haskell/data-default:=[profile?]
	>=dev-haskell/derive-2.4:=[profile?] <dev-haskell/derive-2.7:=[profile?]
	>=dev-haskell/dlist-0.4.1:=[profile?]
	>=dev-haskell/dynamic-state-0.1.0.5:=[profile?]
	>=dev-haskell/dyre-0.8.11:=[profile?]
	dev-haskell/exceptions:=[profile?]
	>=dev-haskell/hashable-1.1.2.5:=[profile?]
	>dev-haskell/hint-0.3.1:=[profile?]
	>=dev-haskell/lens-4.4.0.1:=[profile?]
	>=dev-haskell/mtl-0.1.0.1:=[profile?]
	dev-haskell/oo-prototypes:=[profile?]
	>=dev-haskell/parsec-3.0:=[profile?]
	>=dev-haskell/pointedlist-0.5:=[profile?]
	>=dev-haskell/regex-base-0.93:=[profile?] <dev-haskell/regex-base-0.94:=[profile?]
	>=dev-haskell/regex-tdfa-1.1:=[profile?] <dev-haskell/regex-tdfa-1.3:=[profile?]
	>=dev-haskell/safe-0.3.4:=[profile?] <dev-haskell/safe-0.4:=[profile?]
	dev-haskell/semigroups:=[profile?]
	>=dev-haskell/split-0.1:=[profile?] <dev-haskell/split-0.3:=[profile?]
	dev-haskell/tagged:=[profile?]
	>=dev-haskell/text-1.1.1.3:=[profile?]
	dev-haskell/transformers-base:=[profile?]
	>=dev-haskell/unix-compat-0.1:=[profile?] <dev-haskell/unix-compat-0.5:=[profile?]
	>=dev-haskell/unordered-containers-0.1.3:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-haskell/utf8-string-0.3.1:=[profile?]
	>=dev-haskell/word-trie-0.2.0.4:=[profile?]
	>=dev-haskell/xdg-basedir-0.2.1:=[profile?] <dev-haskell/xdg-basedir-0.3:=[profile?]
	>=dev-haskell/yi-language-0.1.0.7:=[profile?]
	>=dev-haskell/yi-rope-0.7.0.0:=[profile?] <dev-haskell/yi-rope-0.8:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	gtk? ( >=dev-haskell/glib-0.13:=[profile?] <dev-haskell/glib-0.14:=[profile?]
		>=dev-haskell/gtk-0.13:=[profile?] <dev-haskell/gtk-0.14:=[profile?]
		>=dev-haskell/pango-0.13:=[profile?] <dev-haskell/pango-0.14:=[profile?] )
	testing? ( >=dev-haskell/quickcheck-2.7:2=[profile?]
			dev-haskell/random:=[profile?] )
	vty? ( >=dev-haskell/vty-5.2.4:=[profile?] <dev-haskell/vty-6:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/hunit
		dev-haskell/tasty
		dev-haskell/tasty-hunit
		dev-haskell/tasty-quickcheck
		!testing? ( dev-haskell/quickcheck ) )
"

src_prepare() {
	cabal_chdeps \
		'QuickCheck >= 2.7 && < 2.8' 'QuickCheck >= 2.7'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag eventlog eventlog) \
		$(cabal_flag gtk pango) \
		$(cabal_flag profiling profiling) \
		--flag=-scion \
		$(cabal_flag testing testing) \
		$(cabal_flag vty vty)
}