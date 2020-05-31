# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing CoffeeScript"
HOMEPAGE="https://github.com/nex3/sass-mode"
SRC_URI="https://github.com/nex3/sass-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DEPEND=">=app-emacs/haml-mode-3.0.15"
RDEPEND=">=app-emacs/haml-mode-3.0.15"
