# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing HAML"
HOMEPAGE="https://github.com/nex3/haml"
SRC_URI="https://github.com/nex3/haml-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND=">=app-emacs/haml-mode-3.0.15"
