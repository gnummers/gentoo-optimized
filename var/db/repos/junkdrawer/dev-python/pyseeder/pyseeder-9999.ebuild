# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1 git-r3

DESCRIPTION="reseed data managment tools for I2P"
HOMEPAGE="https://github.com/PurpleI2P/pyseeder"
EGIT_REPO_URI="https://github.com/PurpleI2P/pyseeder"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
