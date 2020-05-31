# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION="HMAC-based Extract-and-Expand Key Derivation Function"
HOMEPAGE="https://pypi.org/project/hkdf/ https://github.com/casebeer/python-hkdf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
