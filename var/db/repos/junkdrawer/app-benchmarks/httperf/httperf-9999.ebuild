# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A tool from HP for measuring web server performance"
HOMEPAGE="https://github.com/httperf/httperf"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/httperf/${PN}.git"
else
	SRC_URI="http://httperf.googlecode.com/files/${P}.tar.gz"
	KEYWORDS="amd64 ~mips x86 ~amd64-linux ~x64-macos"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug libressl"

RDEPEND="!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README.md TODO )

src_prepare() {
	default
	eautoreconf
}
