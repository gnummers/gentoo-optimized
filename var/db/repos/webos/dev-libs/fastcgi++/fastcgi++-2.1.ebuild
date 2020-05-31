# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/fcgi/fcgi-2.4.1_pre0910052249.ebuild,v 1.9 2012/07/29 23:56:22 blueness Exp $

EAPI="5"

inherit eutils autotools-utils

DESCRIPTION="FastCGI++ C++ framework"
HOMEPAGE="http://www.nongnu.org/fastcgipp/"
SRC_URI="http://download.savannah.nongnu.org/releases/fastcgipp/fastcgi++-$PV.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~x86-fbsd"

DEPEND="dev-libs/boost virtual/mysql"
RDEPEND="${DEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
        local myeconfargs=(
                --disable-static
        )
        autotools-utils_src_configure
}
				#CPPFLAGS=-I"${WORKDIR}/${P}_build/include"

