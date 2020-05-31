# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

EGIT_REPO_URI="https://github.com/pg-strom/devel.git"
EGIT_BRANCH="STABLE_v1"

DESCRIPTION="A custom-scan provider module for the PostgreSQL database."
HOMEPAGE="https://github.com/pg-strom/devel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql:9.5[server]
	>=dev-util/nvidia-cuda-toolkit-7.0
"
RDEPEND="${DEPEND}"

src_prepare()
{
	sed -i '/^CUDA_PATH_LIST\b/ s/$/ \/opt\/cuda/' "${S}/Makefile"
}
