# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="Easily let-bind values of an assoc-list by their names"
HOMEPAGE="https://elpa.gnu.org/packages/let-alist.html"
SRC_URI="https://elpa.gnu.org/packages/${P}.el"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}

src_unpack() {
	cp "${DISTDIR}"/${P}.el ${PN}.el || die
}
