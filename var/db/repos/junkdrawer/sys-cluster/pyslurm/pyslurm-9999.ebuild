# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Python interface to Slurm"
HOMEPAGE="https://github.com/PySlurm/pyslurm"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/PySlurm/${PN}"
else
	SRC_URI=""
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-cluster/slurm-17.11
	<sys-cluster/slurm-18.08"
DEPEND="${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
