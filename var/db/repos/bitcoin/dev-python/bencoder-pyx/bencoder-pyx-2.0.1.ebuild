# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7,3_8} )

inherit distutils-r1

MyPN="${PN/-/.}"

DESCRIPTION="A fast bencode implementation in Cython"
HOMEPAGE="https://github.com/whtsky/bencoder.pyx"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${MyPN}-${PV}"
