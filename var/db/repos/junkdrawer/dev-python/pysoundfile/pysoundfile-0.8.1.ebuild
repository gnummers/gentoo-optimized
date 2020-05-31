# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1

MY_PN="PySoundFile"

DESCRIPTION="an audio library based on libsndfile, CFFI, and NumPy"
HOMEPAGE="https://github.com/bastibe/PySoundFile"
SRC_URI="https://github.com/bastibe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/cffi-0.6[${PYTHON_USEDEP}]
	media-libs/libsndfile"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_PN}-${PV}"
