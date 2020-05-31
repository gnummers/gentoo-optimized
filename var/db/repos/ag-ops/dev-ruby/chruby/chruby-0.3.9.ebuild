# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Small script for changing current Ruby version in shell."
HOMEPAGE="https://github.com/postmodern/chruby"
SRC_URI="https://github.com/postmodern/chruby/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( app-shells/bash app-shells/zsh )"
RDEPEND="${DEPEND}"

pkg_postinst() (
	elog "chruby aims to be project-specific Ruby version changer. "
	elog "For changing system default Ruby version use "
	elog "app-eselect/eselect-ruby."
	elog " "
	elog "---------------------------------------- "
	elog "Add the following lines to your ~/.bashrc for access to"
	elog "alternate ruby versions installed with dev-ruby/ruby-install: "
	elog " "
	elog "[[ -f /usr/local/share/chruby/chruby.sh ]] && . /usr/local/share/chruby/chruby.sh"
	elog "For auto-switching:"
	elog "[[ -f /usr/local/share/chruby/auto.sh ]] && . /usr/local/share/chruby/auto.sh"
)
