# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="Application Layer DoS attack simulator"
HOMEPAGE="http://code.google.com/p/slowhttptest"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake LDFLAGS="${LDFLAGS}"
}
