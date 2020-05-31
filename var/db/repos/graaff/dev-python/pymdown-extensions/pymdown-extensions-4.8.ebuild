# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A collection of extensions for Python Markdown"
HOMEPAGE="https://github.com/facelessuser/pymdown-extensions"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/markdown-2.6[${PYTHON_USEDEP}]
	=dev-python/markdown-2*[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"
