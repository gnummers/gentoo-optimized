# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="Black is the uncompromising Python code formatter"
HOMEPAGE="https://github.com/psf/black"
EGIT_REPO_URI="https://github.com/psf/black.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
DEPEND="
	>=dev-python/click-6.5
	>=dev-python/attrs-18.1.0
	dev-python/appdirs
	>=dev-python/toml-0.9.4
	>=dev-python/typed-ast-1.4.0
	>=dev-python/regex-2020.1.8
	>=dev-python/pathspec-0.6
	<dev-python/pathspec-1
	>=dev-python/typing-extensions-3.7.4
	>=dev-python/mypy_extensions-0.4.3
	>=dev-python/aiohttp-3.3.2
	dev-python/aiohttp-cors
	"
