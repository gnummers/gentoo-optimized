# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="An open source ecosystem for IoT development"
HOMEPAGE="https://platformio.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/setuptools"
RDEPEND="${DEPEND}
	<dev-python/bottle-0.13
	>=dev-python/click-5
	<dev-python/click-8
	dev-python/colorama
	>=dev-python/pyserial-3
	<dev-python/pyserial-4
	>=dev-python/requests-2.4
	<dev-python/requests-3
	>=dev-python/semantic_version-2.8.1
	<dev-python/semantic_version-3
	>=dev-python/tabulate-0.8.3
	<dev-python/tabulate-1
	>=dev-python/pyelftools-0.25
	<dev-python/pyelftools-1
	>=dev-python/marshmallow-2.20.5
	<dev-python/marshmallow-3"
