# Copyright Jochen Klein

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="A simple build tool for the ALCIE experiment software and its externals"
HOMEPAGE="https://alisw.github.io/alibuild"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
