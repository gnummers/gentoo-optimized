# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1

DESCRIPTION="Parsing HTML and CSS color values"
HOMEPAGE="https://github.com/ext/pyhtmlcolor https://pypi.python.org/pypi/htmlcolor"
SRC_URI="https://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="BSD"
