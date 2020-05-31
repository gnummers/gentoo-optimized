# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils

DESCRIPTION="An open-source C++ library developed and used at Facebook"
HOMEPAGE="https://github.com/facebook/folly"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/facebook/folly.git"
else
	SRC_URI="https://github.com/facebook/folly/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="static-libs"

DEPEND="dev-libs/double-conversion
		<dev-libs/libevent-2.1
		dev-libs/openssl:*
		dev-cpp/gflags
		dev-cpp/glog
		>=dev-libs/boost-1.51.0[context,threads]
		<dev-libs/boost-1.59[context,threads]
		app-arch/lz4
		app-arch/snappy
		sys-libs/zlib
		app-arch/xz-utils"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/${PN}"
