# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eapi7-ver

DESCRIPTION="A collection of useful extensions for Django"
HOMEPAGE="https://github.com/djblets/djblets"
SRC_URI="https://downloads.reviewboard.org/releases/${PN}/$(ver_cut 1-2)/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-1.6.11.1[${PYTHON_USEDEP}]
	<dev-python/django-1.12[${PYTHON_USEDEP}]
	>=dev-python/django-pipeline-1.6.14[${PYTHON_USEDEP}]
	=dev-python/django-pipeline-1.6*[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/feedparser-5.1.2[${PYTHON_USEDEP}]
	dev-python/pillowfight[${PYTHON_USEDEP}]
	>=dev-python/publicsuffix-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	net-libs/nodejs"

src_unpack() {
	default

	cd "${S}"
	npm install less@3.9.0 less-plugin-autoprefix@2.0.0 uglify-js@2.4.10 babel-cli@6.5.1 babel-preset-es2015@6.5.0 babel-plugin-dedent@2.0.0 || die
}

src_install() {
	export PATH="node-modules/.bin:${PATH}"
	distutils-r1_src_install
}
