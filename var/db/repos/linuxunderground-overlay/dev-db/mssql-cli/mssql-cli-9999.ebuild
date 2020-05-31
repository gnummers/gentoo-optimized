# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="Command-line client for SQL Server with auto-completion and syntax highlighting"
HOMEPAGE="https://github.com/dbcli/mssql-cli"
EGIT_REPO_URI="https://github.com/dbcli/mssql-cli"

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
	git-r3_src_unpack
	cd "${S}/mssqlcli/mssqltoolsservice/" || die
	mkdir bin
	cd bin
	unpack ../../../sqltoolsservice/manylinux1/Microsoft.SqlTools.ServiceLayer-rhel-x64-netcoreapp2.2.tar.gz
}

src_prepare() {
	default
	sed -i -e '/mssql-cli.bat/ d' setup.py || die
}
