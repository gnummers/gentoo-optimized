# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

MY_PV=$(ver_cut 1-3)
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Small script for changing current Ruby version in shell."
HOMEPAGE="https://github.com/postmodern/chruby"
SRC_URI="https://github.com/postmodern/chruby/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( app-shells/bash app-shells/zsh )"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's/DOC_DIR=/DOC_DIR?=/' Makefile
}

src_install() {
	# The default, with changed prefix only
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake PREFIX="${D}/usr" DESTDIR="${D}" install
	fi

	insinto /etc/profile.d
	newins "${FILESDIR}/${PN}env.sh" "${PN}"
}

pkg_postinst() {
	elog " "
	elog "chruby aims to be a project-specific Ruby version changer. "
	elog "For changing system default Ruby version, please use "
	elog "app-eselect/eselect-ruby."
	elog " "
}
