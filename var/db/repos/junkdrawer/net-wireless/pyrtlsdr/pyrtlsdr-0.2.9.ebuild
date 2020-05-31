# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION="Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
HOMEPAGE="https://github.com/roger-/pyrtlsdr"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/roger-/${PN}.git"
else
	SRC_URI="https://github.com/roger-/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-wireless/rtl-sdr"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/m2r[${PYTHON_USEDEP}]"
