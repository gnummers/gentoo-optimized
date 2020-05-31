# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="Python refactoring library"
HOMEPAGE="https://github.com/python-rope/rope"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="!dev-python/rope_py3k"
# Dependency for docbuild documentation which is not noted in
# setup.py, using standard docutils builds docs successfully.
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
