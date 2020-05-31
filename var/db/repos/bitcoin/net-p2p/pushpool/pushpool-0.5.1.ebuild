# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

DESCRIPTION="Bitcoin crypto-currency pooled mining proxy"
HOMEPAGE="https://github.com/jgarzik/pushpool"
SRC_URI="http://yyz.us/bitcoin/${P}.tar.gz"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+longpolling mysql postgres sqlite"

DEPEND="
	=dev-libs/jansson-1*
	dev-libs/libevent
	dev-libs/libmemcached
	dev-libs/openssl
	net-misc/curl
	sys-libs/zlib
	longpolling? (
		dev-python/pycrypto
	)
	mysql? (
		dev-db/mysql
	)
	postgres? (
		dev-db/postgresql-server
	)
	sqlite? (
		dev-db/sqlite
	)
"
RDEPEND="${DEPEND}
"

src_configure() {
	econf \
		$(use_with mysql) \
		$(use_with postgres postgresql) \
		$(use_with sqlite sqlite3) \
	|| die 'econf failed'
}

src_install() {
	emake install DESTDIR="${D}" || die 'emake install failed'
	dodoc example-blkmon.cfg
	dodoc example-cfg.json
}
