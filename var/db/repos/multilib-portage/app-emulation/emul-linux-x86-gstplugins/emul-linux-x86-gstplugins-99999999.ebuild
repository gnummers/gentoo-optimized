# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Metapackage to provide 32bit libraries via multilib"
HOMEPAGE="http://www.gentoo.org/"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64"
SLOT="0"
IUSE="+development nodep"

RDEPEND="!nodep? ( =app-emulation/emul-linux-x86-baselibs-${PV}
	=app-emulation/emul-linux-x86-db-${PV}
	=app-emulation/emul-linux-x86-gtklibs-${PV}
	=app-emulation/emul-linux-x86-medialibs-${PV}
	=app-emulation/emul-linux-x86-soundlibs-${PV}
	>=media-libs/gst-plugins-bad-0.10.23-r1[multilib_abi_x86]
	>=media-libs/gst-plugins-good-0.10.31[multilib_abi_x86]
	>=media-libs/gst-plugins-ugly-0.10.19[multilib_abi_x86] )"
