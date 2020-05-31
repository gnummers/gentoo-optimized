# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Portable code"
HOMEPAGE="http://projects.sidvind.com/libportable/"
SRC_URI="http://projects.sidvind.com/libportable/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	eapply "${FILESDIR}/autoconf-cppunit.patch"
	eapply_user

	einfo "Regenerating autotools files..."
	eautoreconf
}
