# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Lua String Hashing/Indexing Library"
HOMEPAGE="http://gitlab.com/ILMostro/awesome4-freedesktop"
SRC_URI="https://gitlab.com/ILMostro/awesome4-freedesktop/-/archive/master/awesome4-freedesktop-master.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

COMMON_DEPEND=">=dev-lang/lua-5.1:*"
DEPEND="${COMMON_DEPEND}
virtual/pkgconfig"
RDEPEND="${COMMON_DEPEND}
>=x11-wm/awesome-4.0:*"

S="${WORKDIR}/awesome4-freedesktop-master"

DOCS=( README.rst LICENSE )
# src_install() {
	# LUA_VERSION=$(readlink -e "${EROOT}"/usr/bin/lua | sed -ne 's:.*/usr/bin/lua\([\d.-]*\):\1:p')
	# insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD lua)"/$LUA_VERSION/${PN}
# doins src/init.lua
# }
