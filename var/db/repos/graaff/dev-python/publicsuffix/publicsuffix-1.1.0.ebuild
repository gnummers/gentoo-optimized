# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Get a public suffix for a domain name using the Public Suffix List"
HOMEPAGE="http://www.tablix.org/~avian/git/publicsuffix.git"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64"
IUSE="test"
LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

python_test() {
	py.test tests.py || die
}
