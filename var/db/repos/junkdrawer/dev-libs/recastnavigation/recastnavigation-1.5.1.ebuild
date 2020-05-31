# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

DESCRIPTION="Navigation-mesh Toolset for Games"
HOMEPAGE="http://digestingduck.blogspot.com https://github.com/recastnavigation/recastnavigation"

if [[ $PV == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="recastnavigation"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/$PN-cmake.patch" )
