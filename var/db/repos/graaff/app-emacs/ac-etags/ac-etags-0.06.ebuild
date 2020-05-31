# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="etags/ctags completion source for auto-complete"
HOMEPAGE="https://github.com/syohex/emacs-ac-etags"
SRC_URI="https://github.com/syohex/emacs-ac-etags/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-${P}"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="Changes README.md"

DEPEND="app-emacs/auto-complete"
RDEPEND=${DEPEND}
