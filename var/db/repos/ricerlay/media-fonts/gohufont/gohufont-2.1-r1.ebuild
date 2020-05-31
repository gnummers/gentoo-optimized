# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font font-ebdftopcf

DESCRIPTION="A monospace bitmap font."
HOMEPAGE="http://font.gohu.org/"
SRC_URI="https://github.com/hchargois/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	font-ebdftopcf_src_compile
}
