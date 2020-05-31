# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sdhand/n30f.git"
fi

DESCRIPTION="A quick hack to display an image in a non-wm-managed window"
HOMEPAGE="https://github.com/sdhand/n30f"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/sdhand/n30f/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="x11-libs/cairo
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"
BDEPEND=""
