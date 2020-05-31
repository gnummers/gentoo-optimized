# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib

DESCRIPTION="A lightweight multi-platform, multi-architecture disassembly framework"
HOMEPAGE="http://www.capstone-engine.org/"
SRC_URI="https://github.com/aquynh/capstone/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/3"
KEYWORDS="~amd64 ~arm ~x86"
#IUSE="python"

#RDEPEND="python? ( >=dev-python/capstone-python-${PV} )"
DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
		emake DESTDIR="${ED}" LIBDIRARCH=$(get_libdir) install
		dodoc README
}
