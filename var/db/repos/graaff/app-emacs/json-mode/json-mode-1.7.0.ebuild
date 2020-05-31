# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="Major mode for editing JSON files"
HOMEPAGE="https://github.com/joshwnj/json-mode"
SRC_URI="https://github.com/joshwnj/json-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DEPEND=">=app-emacs/json-reformat-0.0.5 >=app-emacs/json-snatcher-1.0.0"
RDEPEND="${DEPEND}"
