# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="OAuth2 goodies for the Djangonauts"
HOMEPAGE="https://github.com/evonove/django-oauth-toolkit"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/django-1.4[${PYTHON_USEDEP}]
	>=dev-python/django-braces-1.1.1[${PYTHON_USEDEP}]
	=dev-python/oauthlib-1.0*[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_prepare() {
	sed -i -e '/oauthlib/ s/1.0.1/1.0.3/' setup.py || die
}
