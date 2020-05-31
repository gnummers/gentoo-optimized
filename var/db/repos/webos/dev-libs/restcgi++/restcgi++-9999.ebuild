# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/fcgi/fcgi-2.4.1_pre0910052249.ebuild,v 1.9 2012/07/29 23:56:22 blueness Exp $

EAPI="5"

inherit git-r3 cmake-utils

DESCRIPTION="Rest FastCGI C++ framework"
HOMEPAGE="https://github.com/feniksa/restcgipp"
EGIT_REPO_URI="https://github.com/feniksa/restcgipp.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE="examples"

DEPEND="dev-libs/boost virtual/mysql"
RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
                $(cmake-utils_use_build examples EXAMPLES)
				-DCGI_BIN=/var/share/localhost/cgi-bin/
        )

        cmake-utils_src_configure
}
