# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eapi7-ver

DESCRIPTION="Official Python client library for the Asana API v1"
HOMEPAGE="https://github.com/asana/python-asana"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/requests-2.14[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.7[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_prepare() {
	sed -i -e '/oauthlib/ s/0.8/0.7/g' setup.py || die
}
