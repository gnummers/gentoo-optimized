# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/python-gitlab/python-gitlab"
	inherit git-r3
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit distutils-r1

DESCRIPTION="Python command line interface to gitlab API"
HOMEPAGE="https://github.com/python-gitlab/python-gitlab/"

LICENSE="LGPL-3"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

iDEPEND="dev-python/setuptools
	>=dev-python/requests-2.22.0
	test? (
		dev-python/testrepository
		dev-python/hacking
		dev-python/httmock
		dev-python/jinja
		dev-python/mock
		>=dev-python/sphinx-1.3
		dev-python/sphinx_rtd_theme )"

python_install_all() {
	distutils-r1_python_install_all
	dodoc -r *.rst docs
}
