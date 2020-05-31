# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ language binding library integrating ZeroMQ with Boost Asio"
HOMEPAGE="https://github.com/zeromq/azmq"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zeromq/azmq.git"
else
	SRC_URI="https://github.com/zeromq/azmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Boost-1.0"
SLOT="0"
IUSE=""

DEPEND=">=net-libs/zeromq-4.0.0
	>=dev-libs/boost-1.54"
RDEPEND="${DEPEND}"
