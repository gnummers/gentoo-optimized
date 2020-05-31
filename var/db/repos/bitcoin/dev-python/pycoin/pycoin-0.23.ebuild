# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python Bitcoin Utilities"
HOMEPAGE="https://pypi.python.org/pypi/pycoin
https://github.com/richardkiss/pycoin"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i 's/import distutils.core/from setuptools import setup/' setup.py
	sed -i 's/distutils.core.setup/setup/' setup.py
}

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
