# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/linuxunderground/${PN}.git
		https://github.com/linuxunderground/${PN}.git"
	inherit git-r3
	SRC_URI=""
else
	SRC_URI="https://codeload.github.com/linuxunderground/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64 ~arm"
fi

SLOT="0"
LICENSE="LGPL-3"
DESCRIPTION="GNU package that show how to use libbeidpkcs11 and the autotools with eid-mw"

HOMEPAGE="https://github.com/linuxunderground/eid-mw-sdk-c"

IUSE="jpeg"

RDEPEND=">=app-crypt/eid-mw-4.3.6
	jpeg? ( virtual/jpeg:0 )"

DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable jpeg)
}
