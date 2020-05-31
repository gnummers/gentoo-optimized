# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

IUSE=""

DESCRIPTION="Major mode for editing Ruby files"
HOMEPAGE="https://github.com/zenspider/enhanced-ruby-mode"
SRC_URI="https://github.com/zenspider/enhanced-ruby-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/enhanced-ruby-mode-${PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.rdoc"

src_install() {
	elisp_src_install

	elisp-install ${PN}/ruby ruby/*
}
