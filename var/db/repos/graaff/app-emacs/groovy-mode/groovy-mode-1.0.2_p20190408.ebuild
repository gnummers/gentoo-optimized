# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=aa531c659758b896ff8fbd307080ce0d1d04ebfb

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing Groovy"
HOMEPAGE="https://github.com/russel/groovy-emacs-modes"
SRC_URI="https://github.com/russel/groovy-emacs-modes/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/groovy-emacs-modes-${COMMIT}"

DEPEND=">=app-emacs/s-1.12.0 >=app-emacs/dash-2.13.0"

src_install() {
	elisp_src_install

	dodoc README.md
}
