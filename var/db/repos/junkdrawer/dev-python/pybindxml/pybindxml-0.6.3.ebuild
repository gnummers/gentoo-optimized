# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_5 )
inherit distutils-r1

DESCRIPTION="Library to handle parsing BIND statistics XML into Python objects"
HOMEPAGE="https://github.com/jforman/pybindxml"
SRC_URI="https://github.com/jforman/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/beautifulsoup:4"
RDEPEND="${DEPEND}"
