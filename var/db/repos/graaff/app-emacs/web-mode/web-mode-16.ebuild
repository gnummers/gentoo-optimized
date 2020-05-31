# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="web template editing mode for emacs"
HOMEPAGE="http://web-mode.org"
SRC_URI="https://github.com/fxbois/web-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
