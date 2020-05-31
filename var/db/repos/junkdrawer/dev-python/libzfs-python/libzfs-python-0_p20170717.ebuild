# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Python CFFI bindings for libzfs"
HOMEPAGE="https://github.com/Xaroth/libzfs-python"
if [ ${PV} == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Xaroth/libzfs-python"
else
	EGIT_COMMIT="146e5f28de5971bb6eb64fd82b098c5f302f0b33"
	SRC_URI="https://github.com/Xaroth/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="sys-fs/zfs
	dev-python/cffi[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
