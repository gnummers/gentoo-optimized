# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Command-Line Tools Core Module"
HOMEPAGE="https://pypi.org/project/azure-cli-core"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="MIT"
SLOT="0"

IUSE=""

RDEPEND=">=dev-python/pyopenssl-17.1[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.5.0.1[${PYTHON_USEDEP}]
	>=dev-python/msrestazure-0.6.3-r1[${PYTHON_USEDEP}]
	>=dev-python/msal-extensions-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/msal-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/knack-0.7.1[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]
	>=dev-python/azure-cli-telemetry-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/azure-mgmt-core-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/azure-mgmt-resource-9.0.0[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	dev-python/asn1crypto[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	# Get the versions from pypi : 
	# Useful for Gentoo maintainer but not for Gentoo users.
	# We do not want any warning if pip is not installed.
	eapply "${FILESDIR}"/pypi_check.patch

	eapply_user
}

python_install() {
	distutils-r1_python_install

	python_export PYTHON_SITEDIR

	# __init__.py are provided by net-misc/azure-cli
	rm "${ED}${PYTHON_SITEDIR}/azure/__init__.py" || die
	rm "${ED}${PYTHON_SITEDIR}/azure/cli/__init__.py" || die

	# Avoid portage file collisions
	rm -r "${ED}${PYTHON_SITEDIR}/azure/__pycache__" || die
	rm -r "${ED}${PYTHON_SITEDIR}/azure/cli/__pycache__" || die
}
