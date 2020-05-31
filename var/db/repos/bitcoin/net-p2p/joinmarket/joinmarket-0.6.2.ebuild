# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )
PYTHON_REQ_USE="sqlite"
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

MyPN=${PN}-clientserver

DESCRIPTION="JoinMarket CoinJoin client and daemon"
HOMEPAGE="https://github.com/JoinMarket-Org/joinmarket-clientserver"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+client daemon"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/chromalog-1.0.5[${PYTHON_MULTI_USEDEP}]
	dev-python/future[${PYTHON_MULTI_USEDEP}]
	dev-python/service_identity[${PYTHON_MULTI_USEDEP}]
	>=dev-python/twisted-19.7.0[${PYTHON_MULTI_USEDEP}]

	client? (
		dev-python/argon2_cffi[${PYTHON_MULTI_USEDEP}]
		>=dev-python/bencoder-pyx-2.0.0[${PYTHON_MULTI_USEDEP}]
		dev-python/coincurve[${PYTHON_MULTI_USEDEP}]
		dev-python/mnemonic[${PYTHON_MULTI_USEDEP}]
		dev-python/pyaes[${PYTHON_MULTI_USEDEP}]
	)

	daemon? (
		dev-python/libnacl[${PYTHON_MULTI_USEDEP}]
		dev-python/pyopenssl[${PYTHON_MULTI_USEDEP}]
		dev-python/txtorcon[${PYTHON_MULTI_USEDEP}]
	)
')"
DEPEND="
"
BDEPEND="$(python_gen_cond_dep '
	dev-python/setuptools[${PYTHON_MULTI_USEDEP}]
')"

S="${WORKDIR}/${MyPN}-${PV}"

do_python_phase() {
	local subdir
	for subdir in "${PYTHON_SUBDIRS[@]}" ; do
		pushd "${subdir}" >/dev/null || die
		"${@}"
		popd >/dev/null || die
	done
}

src_prepare() {
	PYTHON_SUBDIRS=( jmbase )
	use client && PYTHON_SUBDIRS+=( jmbitcoin jmclient )
	use daemon && PYTHON_SUBDIRS+=( jmdaemon )

	sed -e '1i#!/usr/bin/python3' -i scripts/*.py

	do_python_phase distutils-r1_src_prepare
}

src_configure() {
	do_python_phase distutils-r1_src_configure
}

src_compile() {
	do_python_phase distutils-r1_src_compile
}

src_install() {
	do_python_phase distutils-r1_src_install

	python_doscript scripts/*.py
}

pkg_preinst() {
	has_version '<net-p2p/joinmarket-0.6.2' && had_pre_0_6_2=1
}

pkg_postinst() {
	# warn when upgrading from pre-0.6.2
	if [[ ${had_pre_0_6_2} ]] ; then
		ewarn 'This release of JoinMarket moves the user data directory to ~/.joinmarket.'
		ewarn 'You must manually move any existing data files. See the release notes:'
		ewarn 'https://github.com/JoinMarket-Org/joinmarket-clientserver/blob/master/docs/release-notes/release-notes-0.6.2.md#move-user-data-to-home-directory'
	fi
}
