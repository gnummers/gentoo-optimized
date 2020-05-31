# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Improved MySQL Graphs for Munin"
HOMEPAGE="https://github.com/mhwest13/Memcached-Munin-Plugin"
LICENSE="GPL-2"

SRC_URI="https://github.com/mhwest13/Memcached-Munin-Plugin/archive/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
	net-analyzer/munin
"

src_install() {
	dodoc README

	exeinto /usr/share/munin/plugins
	doexe memcached_multi_
}
