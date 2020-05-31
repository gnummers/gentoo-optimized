# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Navigation-mesh Toolset for Games"
HOMEPAGE="http://digestingduck.blogspot.com https://github.com/recastnavigation/recastnavigation"

if [[ $PV == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	EGIT_COMMIT="9f9efe943ed54a31b02270fb13b301754e918528"
	SRC_URI="https://github.com/${PN}/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

LICENSE="recastnavigation"
SLOT="0"
IUSE="demo examples test static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DRECASTNAVIGATION_DEMO=$(usex demo)
		-DRECASTNAVIGATION_EXAMPLES=$(usex examples)
		-DRECASTNAVIGATION_TESTS=$(usex test)
		-DRECASTNAVIGATION_STATIC=$(usex static-libs)
	)

	cmake-utils_src_configure
}
