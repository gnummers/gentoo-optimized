# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

[[ "${PV}" = *9999* ]] && live=git-r3
inherit toolchain-funcs ${live}

MY_PN=Penlight

DESCRIPTION="Generally useful pure Lua modules"
HOMEPAGE="https://github.com/stevedonovan/Penlight"
if [[ "${PV}" = *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/stevedonovan/${PN}.git"
else
	SRC_URI="https://github.com/stevedonovan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

IUSE="luajit"

RDEPEND="!luajit? ( >=dev-lang/lua-5.1 )
	luajit? ( dev-lang/luajit:2 )
	dev-lua/luafilesystem"

DOCS=( "README.md" "CHANGES.md" )

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	local lua=lua
	use luajit && lua=luajit

	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})"
	doins -r lua/pl
}
