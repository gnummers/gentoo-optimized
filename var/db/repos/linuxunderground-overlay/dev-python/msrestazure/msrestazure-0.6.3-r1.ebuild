# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="AutoRest swagger generator Python client runtime. Azure-specific module"
HOMEPAGE="https://pypi.org/project/msrestazure"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="MIT"
SLOT="0"

RDEPEND=">=dev-python/adal-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/msrest-0.6.14[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
