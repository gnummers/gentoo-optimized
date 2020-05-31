# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1 git-r3

DESCRIPTION="Jinja2 + YAML based config templater"
HOMEPAGE="https://github.com/metakirby5/zenbu"
EGIT_REPO_URI="https://github.com/metakirby5/zenbu.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DOCS=( README.rst LICENSE example )

DEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/watchdog[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
