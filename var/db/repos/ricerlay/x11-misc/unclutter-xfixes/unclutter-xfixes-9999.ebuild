# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Airblader/unclutter-xfixes.git"
fi

DESCRIPTION="A rewrite of unclutter using the x11-xfixes extension"
HOMEPAGE="https://github.com/Airblader/unclutter-xfixes"

if [[ ${PV} == *9999  ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/Airblader/unclutter-xfixes/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libXi
	dev-libs/libev
	x11-libs/libX11
	x11-libs/libXfixes
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	sed -e "s/\$(shell git describe --all --long --always)/${PV}/" \
		-i Makefile || die
}
