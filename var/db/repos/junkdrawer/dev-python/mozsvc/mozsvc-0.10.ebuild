# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN="mozservices"
MY_P=${MY_PN}-${PV}

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Various utilities for Mozilla apps"
HOMEPAGE="https://github.com/mozilla-services/mozservices"
SRC_URI="https://github.com/mozilla-services/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/konfig[${PYTHON_USEDEP}]
	>=dev-python/pyramid-1.5[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
