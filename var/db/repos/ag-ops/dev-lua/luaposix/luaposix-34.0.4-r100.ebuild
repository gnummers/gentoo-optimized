# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Bindings for POSIX APIs"
HOMEPAGE="https://luaposix.github.io/luaposix/ https://github.com/luaposix/luaposix"
SRC_URI="https://github.com/luaposix/luaposix/archive/release-v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="public-domain"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-lang/lua:*"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}-release-v${PV}

src_compile() {
	lua build-aux/luke || die
}

src_install() {
	LUA_VERSION=$(readlink -e "${EROOT}"/usr/bin/lua | sed -ne 's:.*/usr/bin/lua\([\d.-]*\):\1:p')
	LUA_LIBDIR="/usr/lib64/lua/$LUA_VERSION"

	insinto "$LUA_LIBDIR"
	insopts -m755
	doins -r "${S}/linux/posix"

	default
}
