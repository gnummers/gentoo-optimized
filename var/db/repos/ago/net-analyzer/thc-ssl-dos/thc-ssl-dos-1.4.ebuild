# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="Tool to DoS"
HOMEPAGE="http://www.thc.org"
SRC_URI="http://www.thc.org/${PN}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2+"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s: /usr/local/lib::" \
		-e "/CFLAGS/d" \
		configure.in || die

	eautoreconf
}
