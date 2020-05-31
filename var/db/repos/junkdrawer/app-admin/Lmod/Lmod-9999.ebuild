# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A Lua-based environment module system supporting TCL and software hierarchy"
HOMEPAGE="http://www.tacc.utexas.edu/tacc-projects/lmod"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/TACC/${PN}.git"
else
	SRC_URI="https://github.com/TACC/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-lua/luaposix
	dev-lua/luafilesystem"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "You should add the following to your ~/.bashrc to use Lmod:"
	elog "[ -f /usr/lmod/lmod/init/bash ] && \\ "
	elog "	source /usr/lmod/lmod/init/bash"
}
