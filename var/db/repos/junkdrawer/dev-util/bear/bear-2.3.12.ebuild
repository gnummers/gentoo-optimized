# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

MY_PN=Bear
MY_P=${MY_PN}-${PV}

DESCRIPTION="a tool that generates a compilation database for clang tooling"
HOMEPAGE="https://github.com/rizsotto/Bear"
SRC_URI="https://github.com/rizsotto/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"
