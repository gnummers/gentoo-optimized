# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Command-line client for SQL Server with auto-completion and syntax highlighting"
HOMEPAGE="https://github.com/dbcli/mssql-cli"
SRC_URI="https://codeload.github.com/dbcli/${PN}/tar.gz/${PV} -> ${P}.tar.gz"

# mssql-cli needs https://github.com/Microsoft/sqltoolsservice
# .net is required to compile sqltoolsservice. So, let's use Microsoft
# binaries embedded with mssql-cli releases. Unhappily, there are only
# x86-64 binaries
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/prompt_toolkit[${PYTHON_USEDEP}]
	dev-python/python-sqlparse[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	~dev-python/cli_helpers-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/applicationinsights-0.11.1[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_unpack() {
	default
	cd "${S}/mssqlcli/mssqltoolsservice/" || die
	mkdir bin
	cd bin
	unpack ../../../sqltoolsservice/manylinux1/Microsoft.SqlTools.ServiceLayer-rhel-x64-netcoreapp2.2.tar.gz
}

src_prepare() {
	default
	sed -i -e '/mssql-cli.bat/ d' setup.py || die
}
