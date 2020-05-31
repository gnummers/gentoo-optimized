# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A set of third-party service integrations for Review Board 3.0+"
HOMEPAGE="https://www.reviewboard.org/"
SRC_URI="https://downloads.reviewboard.org/releases/${PN}/$(ver_cut 1-2)/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/asana[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	=dev-util/reviewboard-3.0*[${PYTHON_USEDEP}]
"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_unpack() {
	default

	cd "${S}"
	npm install less@2.5.0 less-plugin-autoprefix@1.5.1 uglify-js@2.4.10 babel-cli@6.5.1 babel-preset-es2015@6.5.0 babel-plugin-dedent@2.0.0 || die
}

python_prepare() {
	:
}

src_install() {
	pushd "${HOME}" || die
	ln -s "${WORKDIR}/rbintegrations-${PV}/node_modules" .node_modules || die
	popd || die
	distutils-r1_src_install
}
