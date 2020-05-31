# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A modern C++ tweening library"
HOMEPAGE="http://mobius3.github.io/tweeny"

inherit eutils cmake-utils

if [[ ${PV} == "9999" ]]; then
	inherit git-r3

	SRC_URI=""
	EGIT_REPO_URI="https://github.com/mobius3/${PN}.git"
else
	SRC_URI="https://github.com/mobius3/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
