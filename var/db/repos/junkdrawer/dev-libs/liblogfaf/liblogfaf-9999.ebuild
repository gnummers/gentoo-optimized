# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A library that logs messages using non-blocking UDP datagrams"
HOMEPAGE="https://github.com/facebook/liblogfaf"
if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/facebook/liblogfaf.git"
else
	SRC_URI="https://github.com/facebook/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
