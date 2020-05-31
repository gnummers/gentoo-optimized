# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="jhc is a haskell compiler"
HOMEPAGE="http://repetae.net/john/computer/jhc/"
SRC_URI="http://repetae.net/computer/jhc/drop/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/ghc-6.10
	dev-haskell/binary
	>=dev-haskell/drift-2.1.1
	dev-haskell/fgl
	dev-haskell/happy
	dev-haskell/hssyck
	dev-haskell/mtl
	app-text/pandoc
	dev-haskell/readline
	dev-haskell/regex-compat
	dev-haskell/syb
	dev-haskell/utf8-string
	dev-haskell/zlib
	dev-perl/YAML
"
RDEPEND=""

src_configure() {
	econf --with-hcflags="${HCFLAGS}"
}
