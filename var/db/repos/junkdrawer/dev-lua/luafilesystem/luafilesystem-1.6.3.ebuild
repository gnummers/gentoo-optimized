# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit multilib toolchain-funcs

MY_PV=${PV//./_}

DESCRIPTION="File System Library for the Lua Programming Language"
HOMEPAGE="https://keplerproject.github.com/luafilesystem/"
SRC_URI="https://github.com/keplerproject/luafilesystem/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	sed -i \
		-e "s|gcc|$(tc-getCC)|" \
		-e "s|/usr/local|/usr|" \
		-e "s|/lib|/$(get_libdir)|" \
		-e "s|-O2|${CFLAGS}|" \
		-e "/^LIB_OPTION/s|= |= ${LDFLAGS} |" \
		config || die
}

src_install() {
	emake PREFIX="${ED}usr" install
	dodoc README
	dohtml doc/us/*
}
