# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Yet another configuration object"
HOMEPAGE="https://github.com/mozilla-services/konfig"
SRC_URI="https://github.com/mozilla-services/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="$(python_gen_cond_dep 'dev-python/configparser[${PYTHON_USEDEP}]' python2_7)"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
