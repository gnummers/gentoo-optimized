# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Installs [Ruby], [JRuby], [Rubinius], [MagLev] or [mruby]."
HOMEPAGE="https://github.com/postmodern/ruby-install"
SRC_URI="https://github.com/postmodern/ruby-install/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="( app-shells/bash )
		|| ( >=sys-devel/gcc-4.2 sys-devel/clang )
		|| ( >=net-misc/wget-1.12 net-misc/curl )"
RDEPEND="${DEPEND}"

