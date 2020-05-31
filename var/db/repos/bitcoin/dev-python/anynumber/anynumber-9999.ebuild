# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit git-r3 python-r1

DESCRIPTION="Python module for working with arbitrary rational numbers, in any radix"
HOMEPAGE="https://gitlab.com/anynumber/python"
EGIT_REPO_URI="https://gitlab.com/anynumber/python.git"

SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	myinstall() {
		insinto $(python_get_sitedir)
		doins anynumber.py || die 'doins failed'
		python_optimize
	}
	python_foreach_impl myinstall
}
