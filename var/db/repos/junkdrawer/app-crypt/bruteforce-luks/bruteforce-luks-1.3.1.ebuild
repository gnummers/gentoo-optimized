# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A bruteforce cracker for LUKS encrypted volumes."
HOMEPAGE="https://github.com/glv2/bruteforce-luks"
SRC_URI="https://github.com/glv2/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="sys-fs/cryptsetup"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS ChangeLog NEWS README)

src_prepare() {
	default
	eautoreconf
}
