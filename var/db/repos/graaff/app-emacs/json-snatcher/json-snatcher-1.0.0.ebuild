# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="Get the path to a JSON element in Emacs"
HOMEPAGE="https://github.com/Sterlingg/json-snatcher"
SRC_URI="https://github.com/Sterlingg/json-snatcher/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DOCS="README.md"

#SITEFILE="50${PN}-gentoo.el"
