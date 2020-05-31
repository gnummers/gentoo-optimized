# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Django app for handling the server headers required for CORS"
HOMEPAGE="https://github.com/ottoyiu/django-cors-headers"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="1.1"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"
