# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# based on net-misc/asterisk-app_rxfax ebuild provided by mva and luke-jr overlays

EAPI=6

inherit git-r3

DESCRIPTION="Asterisk application providing a V.21/V.22/V.23 compatible soft-modem for inbound connections"
HOMEPAGE="https://github.com/proquar/asterisk-Softmodem"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND="media-libs/spandsp
        >=net-misc/asterisk-13"

EGIT_REPO_URI="https://github.com/proquar/asterisk-Softmodem.git"
EGIT_COMMIT="14e5b4f9ebbd8dcbf107a397e26b5385771bdff7"

MyPN="app_softmodem"

src_compile() {
	gcc $CFLAGS -shared -fPIC -lspandsp -o "${MyPN}".{so,c} || die compile
}

src_install() {
	exeinto "/usr/lib/asterisk/modules"
	doexe "${MyPN}.so" || die install
}
