# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

DESCRIPTION="Bitcoin crypto-currency pooled mining proxy"
HOMEPAGE="https://github.com/jgarzik/pushpool"
SRC_URI="https://download.github.com/jgarzik-${PN}-v${PV}-0-gf285622.zip"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+longpolling postgres sqlite"

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
	postgres? (
		dev-db/postgresql-server
	)
	sqlite? (
		dev-db/sqlite
	)
"
RDEPEND="${DEPEND}
"
DEPEND="${DEPEND}
	app-arch/unzip
"

S="${WORKDIR}/jgarzik-${PN}-52419b9"

src_prepare() {
	./autogen.sh
}

src_configure() {
	# MySQL is broken in this version
	econf \
		--without-mysql \
		$(use_with postgres postgresql) \
		$(use_with sqlite sqlite3) \
	|| die 'econf failed'
}

src_install() {
	emake install DESTDIR="${D}" || die 'emake install failed'
	dodoc example-blkmon.cfg
	dodoc example-cfg.json
}
