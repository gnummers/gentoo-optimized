# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_6 )
inherit cmake-utils git-r3 python-r1 distutils-r1

DESCRIPTION="New open source tool for binary data analysis"
SLOT="0"

HOMEPAGE="https://codisec.com/veles/"

EGIT_REPO_URI="https://github.com/codilime/veles.git"

LICENSE="Apache-2.0"

KEYWORDS="~amd64"

DEPEND="sys-libs/zlib
	>=dev-util/cmake-3.1.0
	>=dev-qt/qtgui-5.5
	>=dev-qt/qtcore-5.5
	>=dev-qt/qtwidgets-5.5
	dev-python/pyopenssl
	dev-python/msgpack
	"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	python_setup
	cmake-utils_src_configure
}


src_compile() {
	cmake-utils_src_compile
	#cd "$WORKDIR/$P"/python
	#distutils-r1_python_compile
}

src_install() {
	cmake-utils_src_install
	cd "$WORKDIR/$P"/python
	distutils-r1_python_install
}
