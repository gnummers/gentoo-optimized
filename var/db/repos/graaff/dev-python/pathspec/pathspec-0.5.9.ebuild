# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="A utility library for pattern matching of file paths"
HOMEPAGE="https://github.com/cpburnz/python-path-specification"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64"
IUSE="test"
LICENSE="MPL-2.0"
SLOT="0"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
