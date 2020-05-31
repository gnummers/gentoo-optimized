# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

MY_PV=${PV/_rc/-rc}
MY_P=${PN}-${MY_PV}

DESCRIPTION="RDMA core userspace libraries and daemons"
HOMEPAGE="https://github.com/linux-rdma/rdma-core"
if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/linux-rdma/rdma-core"
else
	SRC_URI="https://github.com/linux-rdma/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="|| ( GPL-2 BSD-2 )"
SLOT="0"
IUSE=""

DEPEND="!sys-fabric/libibverbs"
RDEPEND="${DEPEND}
	sys-apps/ethtool"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}"/etc
		-DCMAKE_INSTALL_UDEV_RULESDIR="$(get_udevdir)"/rules.d
	)

	cmake-utils_src_configure
}
