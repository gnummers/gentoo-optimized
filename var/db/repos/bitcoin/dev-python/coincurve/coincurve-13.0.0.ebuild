# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Cross-platform Python CFFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/ofek/coincurve"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="
	>=dev-libs/libsecp256k1-0.1_pre20191012[ecdh,recovery]
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.3.0[${PYTHON_USEDEP}]
	')
"
RDEPEND="${CDEPEND}
	$(python_gen_cond_dep '
		dev-python/asn1crypto[${PYTHON_USEDEP}]
	')
"
DEPEND="${CDEPEND}"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	default

	# prevent dependency download
	mkdir -p libsecp256k1
}
