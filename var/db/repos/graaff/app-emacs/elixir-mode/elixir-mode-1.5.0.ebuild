# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="Emacs major mode for Elixir"
HOMEPAGE="https://github.com/elixir-lang/emacs-elixir"
SRC_URI="https://github.com/elixir-lang/emacs-elixir/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/emacs-elixir-${PV}"

src_install() {
	elisp_src_install

	dodoc README.md
}
