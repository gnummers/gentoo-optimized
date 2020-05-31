# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="Emacs plugin to show the current buffer's imenu entries in a seperate buffer"
HOMEPAGE="https://github.com/bmag/imenu-list"
SRC_URI="https://github.com/bmag/imenu-list/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="|| ( GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS=( README.md )
