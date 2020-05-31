# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A Lua-based environment module system supporting TCL and software hierarchy"
HOMEPAGE="http://www.tacc.utexas.edu/tacc-projects/lmod"
SRC_URI="https://github.com/TACC/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lua/luaposix
		>=dev-lua/luafilesystem-1.6.2"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "You should add the following to your ~/.bashrc to use Lmod:"
	elog "[ -f /usr/lmod/lmod/init/bash ] && \\ "
	elog "	source /usr/lmod/lmod/init/bash"
}
