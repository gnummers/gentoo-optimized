# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Twisted-based Tor controller client, with state-tracking and config abstractions"
HOMEPAGE="https://github.com/meejah/txtorcon https://pypi.org/project/txtorcon/ https://txtorcon.readthedocs.org"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="examples test" # doc removed due to deficient dependencies
RESTRICT="!test? ( test )"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/automat[${PYTHON_USEDEP}]
		dev-python/incremental[${PYTHON_USEDEP}]
		>=dev-python/twisted-15.5.0[${PYTHON_USEDEP},crypt]
		>=dev-python/zope-interface-3.6.1[${PYTHON_USEDEP}]
	')
"
DEPEND="
	${RDEPEND}
	$(python_gen_cond_dep '
		test? ( dev-python/mock[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/setuptools-36.2[${PYTHON_USEDEP}]
	')
"
# some of these dependencies don't support python{3_7,3_8}
#		doc? (
#			dev-python/automat[${PYTHON_USEDEP}]
#			dev-python/pep8[${PYTHON_USEDEP}]
#			dev-python/pyflakes[${PYTHON_USEDEP}]
#			>=dev-python/repoze-sphinx-autointerface-0.4[${PYTHON_USEDEP}]
#			dev-python/sphinx[${PYTHON_USEDEP}]
#			dev-python/twine[${PYTHON_USEDEP}]
#			>=dev-python/twisted-11.1.0[${PYTHON_USEDEP},crypt]
#			dev-python/wheel[${PYTHON_USEDEP}]
#			>=dev-python/zope-interface-3.6.1[${PYTHON_USEDEP}]
#		)

PATCHES=(
	"${FILESDIR}/txtorcon-0.19.3-Movetestsunderthetxtorconnamespace.patch"
	"${FILESDIR}/txtorcon-0.19.3-Removeunconditionalexamples.patch"
	"${FILESDIR}/txtorcon-0.19.3-Removeinstalldocs.patch"
)

python_test() {
	pushd "${TEST_DIR}" > /dev/null || die
	/usr/bin/trial txtorcon || die "Tests failed with ${EPYTHON}"
	popd > /dev/null || die
}

#python_compile_all() {
#	use doc && emake -C "${S}/docs" html
#}

python_install_all() {
	use examples && dodoc -r "${S}/examples/"
#	if use doc ; then
#		docinto html
#		dodoc -r "${S}/docs/_build/html/"*
#	fi
	distutils-r1_python_install_all
}
