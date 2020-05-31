# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1

DESCRIPTION="RPC stack for Emacs Lisp - bidirectional integration between Python and Emacs"
HOMEPAGE="http://python-epc.readthedocs.org/en/latest/ https://pypi.python.org/pypi/epc"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

DEPEND="~dev-python/sexpdata-0.0.3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
