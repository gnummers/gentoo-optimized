# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing CoffeeScript"
HOMEPAGE="https://github.com/defunkt/coffee-mode"
SRC_URI="https://github.com/defunkt/coffee-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	sed -i -e 's/$(CASK) exec//' Makefile || die
}

src_install() {
	elisp_src_install

	dodoc README.md
}
