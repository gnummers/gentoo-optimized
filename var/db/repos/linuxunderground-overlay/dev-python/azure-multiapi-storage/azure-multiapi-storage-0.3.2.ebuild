# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Storage Client Library for Python"
HOMEPAGE="https://pypi.org/project/azure-multiapi-storage"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/azure-common-1.1.25[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install() {
	distutils-r1_python_install

	python_export PYTHON_SITEDIR

	# __init__.py are provided by net-misc/azure-cli
	rm "${ED}${PYTHON_SITEDIR}/azure/__init__.py" || die

	# Avoid portage file collisions
	rm -r "${ED}${PYTHON_SITEDIR}/azure/__pycache__" || die
}
