# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/dylanaraps/pywal.git"
fi

inherit distutils-r1 ${SCM}

DESCRIPTION="Generate and change color-schemes on the fly."
HOMEPAGE="https://github.com/dylanaraps/pywal"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/dylanaraps/${PN}/archive/${PV}.tar.gz -> ${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	media-gfx/imagemagick
"
BDEPEND=""
