# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="Efficient JSON-RPC for Python"
HOMEPAGE="https://github.com/jgarzik/python-bitcoinrpc"
MyPV="${PV}-g61334635"
MyP="python-${PN}-${MyPV}"
SRC_URI="http://yyz.us/bitcoin/${MyP}.tar.gz"
MyPy="jsonrpc/authproxy.py"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+jsonrpc-compat"

DEPEND="jsonrpc-compat? ( !dev-python/jsonrpc )
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S="${WORKDIR}/${MyP}"

MyPy() {
	if use jsonrpc-compat; then
		echo jsonrpc
	else
		echo "${MyPy}"
	fi
}

src_install() {
	myinstall() {
		local subdir=
		use jsonrpc-compat || subdir=/jsonrpc
		insinto "$(python_get_sitedir)${subdir}"
		doins -r $(MyPy) || die 'doins failed'
		python_optimize
	}
	python_foreach_impl myinstall
}
