# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing pony"
HOMEPAGE="https://github.com/SeanTAllen/ponylang-mode/"
SRC_URI="https://github.com/SeanTAllen/ponylang-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
DOCS="CHANGELOG.md README.md"
