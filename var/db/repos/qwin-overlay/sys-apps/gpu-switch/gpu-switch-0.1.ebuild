# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit eutils

DESCRIPTION="Gentoo video driver switch for NVIDIA"
HOMEPAGE="https://github.com/Flex1911/gpu-switch"
SRC_URI="https://github.com/Flex1911/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-drivers/xf86-video-nouveau
	x11-drivers/nvidia-drivers
	app-shells/bash"
RDEPEND="${DEPEND}"

src_install(){
	dobin gpu-switch
}

pkg_postinst() {
	elog "'gpu-switch nvidia' to use nvidia, 'gpu-switch nouveau' to use nouveau"
}
