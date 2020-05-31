# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Embedded C/C++ web server"
HOMEPAGE="https://github.com/civetweb/civetweb"
if [[ $PV == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/civetweb/civetweb"
else
	SRC_URI="https://github.com/civetweb/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT-with-advertising"
SLOT="0"
IUSE="cgi cxx ipv6 lua ssl websockets"

DEPEND="lua? ( dev-lang/lua:* )
		ssl? ( dev-libs/openssl:* )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/civetweb-1.6-makefile.patch"
}

src_compile() {
	local myconf
	local copt

	if use lua; then
		myconf="${myconf} WITH_LUA_SHARED=1"
	fi

	if use ipv6; then
		myconf="${myconf} WITH_IPV6=1"
	fi

	if use websockets; then
		myconf="${myconf} WITH_WEBSOCKET=1"
	fi

	if use cxx; then
		myconf="${myconf} WITH_CPP=1"
	fi

	if ! use ssl; then
		copt="${copt} -DNO_SSL"
	fi

	if ! use cgi; then
		copt="${copt} -DNO_CGI"
	fi

	emake slib ${myconf} COPT="${copt}"
}

src_install() {
	dolib libcivetweb.so*
	insinto /usr/include
	doins include/civetweb.h
}
