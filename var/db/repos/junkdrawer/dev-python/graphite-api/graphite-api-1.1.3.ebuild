# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

DESCRIPTION="The rendering HTTP API from Graphite-web, without the interface"
HOMEPAGE="https://github.com/brutasse/graphite-api"
SRC_URI="https://github.com/brutasse/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/cairocffi[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-1.5.7[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/structlog[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
