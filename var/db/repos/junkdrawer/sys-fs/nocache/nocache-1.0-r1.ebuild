# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib

DESCRIPTION="nocache - minimize filesystem caching effects"
HOMEPAGE="https://github.com/Feh/nocache"
SRC_URI="https://github.com/Feh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="BSD"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
	emake PREFIX=/usr
}

src_install(){
	einstall PREFIX=/usr DESTDIR="${D}" LIBDIR="/$(get_libdir)"
}
