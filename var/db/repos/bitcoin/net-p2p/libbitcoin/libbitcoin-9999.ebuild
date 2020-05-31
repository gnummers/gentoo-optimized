# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="https://github.com/libbitcoin/libbitcoin.git"
inherit git-r3 autotools

DESCRIPTION="libbitcoin asynchronous C++ library for Bitcoin"
HOMEPAGE="http://libbitcoin.org/"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+leveldb testnet debug doc"

RDEPEND="
	>=dev-libs/boost-1.48.0
	>=dev-libs/openssl-0.9
	dev-libs/secp256k1
	leveldb? ( dev-libs/leveldb )
"

DEPEND="${RDEPEND}
	>=sys-devel/gcc-4.7
"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable leveldb) $(use_enable testnet) $(use_enable debug) || die "Configure failed"
}

src_compile() {
	emake || die "Compile failed"
}

src_install() {
	if use doc; then
		dodoc  AUTHORS ChangeLog INSTALL NEWS README doc/style || die
		dohtml doc/libbitcoin/* || die
	fi

	emake DESTDIR="${D}" install || die "Install failed"
}
