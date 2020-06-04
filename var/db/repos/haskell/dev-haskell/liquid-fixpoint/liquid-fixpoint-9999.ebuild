# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999
#hackport: flags: -devel

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal git-r3

DESCRIPTION="Predicate Abstraction-based Horn-Clause/Implication Constraint Solver"
HOMEPAGE="https://github.com/ucsd-progsys/liquid-fixpoint"
EGIT_REPO_URI="https://github.com/ucsd-progsys/liquid-fixpoint.git"
EGIT_BRANCH="develop"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=""
IUSE=""

RESTRICT=test

RDEPEND="dev-haskell/ansi-terminal:=[profile?]
	>=dev-haskell/ascii-progress-0.3:=[profile?]
	dev-haskell/async:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/boxes:=[profile?]
	dev-haskell/cereal:=[profile?]
	dev-haskell/cmdargs:=[profile?]
	dev-haskell/fgl:=[profile?]
	dev-haskell/hashable:=[profile?]
	dev-haskell/intern:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/parallel:=[profile?]
	dev-haskell/parsec:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/text-format:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-lang/ghc-8.0.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.2.0
	test? ( >=dev-haskell/mtl-2.2.2
		>=dev-haskell/stm-2.4
		>=dev-haskell/tasty-0.10
		dev-haskell/tasty-ant-xml
		>=dev-haskell/tasty-hunit-0.9
		>=dev-haskell/tasty-rerun-1.1.12 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-devel
}