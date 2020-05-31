# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="A full-featured & carefully designed adaptive prompt for Bash & Zsh"
HOMEPAGE="https://github.com/nojhan/liquidprompt"
SRC_URI="https://github.com/nojhan/liquidprompt/archive/v_${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-v_${PV}"

LICENSE="AGPL-3"
SLOT="0"

KEYWORDS="~amd64"
IUSE=""

src_install() {
	dodoc example.bashrc CHANGES README.md

	# The included debian and arch packages install liquidprompt in
	# /usr/bin
	insinto /usr/share/liquidprompt
	doins liquidprompt
	doins liquid.theme
	doins liquid.ps1
	insinto /etc/
	newins liquidpromptrc-dist liquidpromptrc
}
