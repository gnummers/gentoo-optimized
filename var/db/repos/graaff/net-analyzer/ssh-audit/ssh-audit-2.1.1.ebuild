# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python2_7 python3_6 python3_7)
inherit python-any-r1

DESCRIPTION="SSH server auditing (banner, key exchange, encryption, mac, compression, etc)"
HOMEPAGE="https://github.com/jtesta/ssh-audit"
SRC_URI="https://github.com/jtesta/ssh-audit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests require prospector which is not packaged

src_install() {
	default

	newbin ssh-audit.py ssh-audit
}
