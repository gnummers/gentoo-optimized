# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/rizsotto/Bear"
fi

inherit cmake-utils ${SCM}

DESCRIPTION="Compilation database generator for Clang"
HOMEPAGE="https://github.com/rizsotto/Bear"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/rizsotto/Bear/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=">=dev-libs/libconfig-1.4"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/Bear-${PV}"
fi
