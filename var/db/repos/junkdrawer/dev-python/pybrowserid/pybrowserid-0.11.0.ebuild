# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

MY_PN="PyBrowserID"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python client library for the BrowserID protocol"
HOMEPAGE="https://github.com/mozilla/PyBrowserID"
SRC_URI="https://github.com/mozilla/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
