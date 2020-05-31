# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{7,8}} )

inherit distutils-r1

DESCRIPTION="Pythonic JUnit/xUnit Result XML Parser"
HOMEPAGE="https://github.com/gastlygem/junitparser"
SRC_URI="https://github.com/gastlygem/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
DEPEND="
	dev-python/future[${PYTHON_USEDEP}]"
