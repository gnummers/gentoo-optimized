# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Python FFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/ludbb/${PN}"
SRC_URI="https://github.com/ludbb/${PN}/archive/0.13.2.4.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="ecdh +recovery schnorr test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/libsecp256k1[ecdh=,recovery=,schnorr(-)=]
	>=dev-python/cffi-1.3.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	>=dev-python/setuptools-2.2[${PYTHON_USEDEP}]
	dev-python/setuptools_scm
	test? (
		>=dev-python/pytest-2.8.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-runner-2.6.2[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	sed -i 's/download_library(self)//' setup.py
	if ! use test; then
		sed -i "s/'pytest-runner==2.6.2'//" setup.py
	fi
}

python_test() {
	py.test || die 'Tests failed'
}
