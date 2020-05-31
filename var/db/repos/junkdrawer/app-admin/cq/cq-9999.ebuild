# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="A command queue"
HOMEPAGE="https://github.com/RPI-HPC/cq"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/RPI-HPC/${PN}"
else
	SRC_URI=""
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/protobuf-c
		net-libs/zeromq
		>=sys-auth/munge-0.5.11"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
