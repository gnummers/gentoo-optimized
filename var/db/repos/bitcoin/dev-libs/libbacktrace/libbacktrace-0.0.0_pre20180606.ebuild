# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A C library that may be linked into a C/C++ program to produce symbolic backtraces"
HOMEPAGE="https://github.com/ianlancetaylor/libbacktrace"

COMMITHASH=5a99ff7fed66b8ea8f09c9805c138524a7035ece
SRC_URI="https://github.com/ianlancetaylor/${PN}/archive/${COMMITHASH}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"

KEYWORDS="~amd64 ~amd64-linux ~arm ~arm64 ~mips ~ppc ~x86 ~x86-linux"
IUSE=""

DEPEND="sys-libs/libunwind"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${COMMITHASH}"
