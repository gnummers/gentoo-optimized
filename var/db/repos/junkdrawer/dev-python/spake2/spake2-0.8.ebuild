# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

DESCRIPTION="SPAKE2 Password-Authenticated Key Exchange algorithm"
HOMEPAGE="https://pypi.org/project/spake2/ https://github.com/warner/python-spake2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/hkdf[${PYTHON_USEDEP}]"
DEPEND="dev-python/versioneer[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
