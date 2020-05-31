# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="AudioScrobbler client for MPD written in C++"
HOMEPAGE="https://50hz.ws/mpdas/"
SRC_URI="https://50hz.ws/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/libmpdclient
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	tc-export CXX
	emake CONFIG="/etc"
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc mpdasrc.example README
}
