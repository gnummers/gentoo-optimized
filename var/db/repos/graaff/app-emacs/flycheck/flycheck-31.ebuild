# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="On the fly syntax checking for GNU Emacs"
HOMEPAGE="https://github.com/flycheck/flycheck"
SRC_URI="https://github.com/flycheck/flycheck/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND=">=app-emacs/dash-2.12.1"
DEPEND=${RDEPEND}

# Requires unpackaged dependencies, e.g. buttercup
RESTRICT="test"

src_prepare() {
	sed -i -e '/^CASK/ s/^/#/' Makefile || die
	eapply_user
}
