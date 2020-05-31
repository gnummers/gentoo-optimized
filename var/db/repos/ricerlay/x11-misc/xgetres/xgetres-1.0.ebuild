# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple utility which prints the value of an X resource"
HOMEPAGE="https://github.com/tamirzb/xgetres"
SRC_URI="https://github.com/tamirzb/xgetres/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin xgetres
	einstalldocs
}
