# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="A complete PKCS#11 wrapper for Python"
HOMEPAGE="https://github.com/LudovicRousseau/PyKCS11"
SRC_URI="https://codeload.github.com/LudovicRousseau/${PN}/tar.gz/${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples"

DEPEND="dev-lang/swig"

DOCS=( README.md )

python_install_all() {
	if use examples; then
		insinto "/usr/share/doc/${PF}/"
		doins -r samples
	fi

	distutils-r1_python_install_all
}
