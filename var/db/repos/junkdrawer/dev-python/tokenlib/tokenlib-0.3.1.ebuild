# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )
inherit distutils-r1

DESCRIPTION="Generic support library for signed-token-based auth schemes"
HOMEPAGE="https://github.com/mozilla-services/tokenlib"
SRC_URI="https://github.com/mozilla-services/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
