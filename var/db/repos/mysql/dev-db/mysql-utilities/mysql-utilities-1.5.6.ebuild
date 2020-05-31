# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Set of command-line utilities for common MySQL tasks"
HOMEPAGE="http://dev.mysql.com/doc/mysql-utilities/"
SRC_URI="mirror://mysql/Downloads/MySQLGUITools/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND=">=dev-python/mysql-connector-python-2.1.2[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_prepare() {
	# conflicts with dev-python/mysql-connector-python
	rm -r "${S}/mysql/connector" || die
	default
}

python_install() {
	distutils-r1_python_install
	# Remove another collision
	rm "${D}usr/$(get_libdir)/${EPYTHON}/site-packages/mysql/__init__.py" || die
}
