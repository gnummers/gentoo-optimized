# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Improved MySQL Graphs for Munin"
HOMEPAGE="https://github.com/mhwest13/Memcached-Munin-Plugin"
LICENSE="GPL-2"

SRC_URI="https://github.com/mhwest13/Memcached-Munin-Plugin/archive/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
	dev-perl/IO-Socket-INET6
	net-analyzer/munin
"

src_prepare() {
	# Ensure that we can connect to IPv6 sockets
	sed -e 's/INET/INET6/' \
		-e '/use IO::Socket/ause IO::Socket::INET6;' \
		-i memcached_* || die

	default
}

src_install() {
	dodoc README

	exeinto /usr/share/munin/plugins
	doexe memcached_multi_
}
