# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"

DESCRIPTION="Check all your JavaScript source code for common mistakes without actually running the script."
HOMEPAGE="http://javascriptlint.com/"
SRC_URI="http://javascriptlint.com/download/${P}-src.tar.gz"
LICENSE="MPL-1.1"  # Website also mentions GPL without version and LGPL-1.1

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

src_compile() {
	make -Csrc -f Makefile.ref
}

src_install() {
	dobin src/Linux_All_DBG.OBJ/jsl
}
