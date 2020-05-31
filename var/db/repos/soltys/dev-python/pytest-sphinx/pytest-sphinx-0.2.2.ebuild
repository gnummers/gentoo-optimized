# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5,6,7,8}} pypy{,3} )

inherit distutils-r1

DESCRIPTION="A doctest plugin for pytest, which understands the sphinx-specific directives"
HOMEPAGE="https://github.com/thisch/pytest-sphinx https://pypi.org/project/pytest-sphinx/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	python_targets_python2_7? (
		dev-python/enum34
	)
"

BDEPEND="
	${RDEPEND}
"
