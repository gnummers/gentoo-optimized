# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="GNU package that show how to use libbeidpkcs11 and the autotools with eid-mw"
HOMEPAGE="https://github.com/linuxunderground/eid-mw-sdk-c"
SRC_URI="https://codeload.github.com/linuxunderground/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="jpeg"

RDEPEND="app-crypt/eid-mw
	jpeg? ( virtual/jpeg:0 )"

DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable jpeg)
}
