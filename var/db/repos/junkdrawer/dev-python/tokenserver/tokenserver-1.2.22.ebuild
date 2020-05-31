# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="The Mozilla token server"
HOMEPAGE="https://github.com/mozilla-services/tokenserver"
SRC_URI="https://github.com/mozilla-services/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/cornice[${PYTHON_USEDEP}]
	>=dev-python/mozsvc-0.8[${PYTHON_USEDEP}]
	dev-python/pybrowserid[${PYTHON_USEDEP}]
	dev-python/testfixtures[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
