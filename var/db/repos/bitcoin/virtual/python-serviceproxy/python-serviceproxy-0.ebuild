# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI='3'

DESCRIPTION="Virtual for jsonrpc.proxy.ServiceProxy"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="|| (
	dev-python/bitcoinrpc[jsonrpc-compat]
	dev-python/jsonrpc
)"
