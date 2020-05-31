# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Based on bit32 ebuild from lua overlay

EAPI="5"

inherit toolchain-funcs

DESCRIPTION="A Lua5.2+ bit manipulation library"
HOMEPAGE="https://github.com/keplerproject/lua-compat-5.2"
SRC_URI="https://github.com/keplerproject/lua-compat-5.2/archive/bitlib-${PV}.tar.gz"
KEYWORDS="~amd64"
READMES=( README.md )

DEPENDS="dev-lang/lua:0="
LICENSE="MIT"
SLOT="0"
IUSE=""

S="${WORKDIR}/lua-compat-5.2-bitlib-${PV}"

src_compile() {
	local MY_PN="lbitlib"

	$(tc-getCC) ${CFLAGS} -fPIC -Ic-api -c -o ${MY_PN}.o ${MY_PN}.c || die
	$(tc-getCC) ${LDFLAGS} -shared -fPIC -llua -o ${PN}.so ${MY_PN}.o || die
}

src_install() {
	insinto /usr/lib64/lua/5.1
	doins "${PN}.so"
}
