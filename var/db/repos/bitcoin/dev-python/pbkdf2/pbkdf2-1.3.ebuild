# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Implementation of the password-based key derivation function, PBKDF2, specified in RSA PKCS#5 v2.0"
HOMEPAGE="http://www.dlitz.net/software/python-pbkdf2/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sparc x86 ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint"
IUSE=""
