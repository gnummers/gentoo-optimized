# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Metapackage to provide 32bit libraries via multilib"
HOMEPAGE="irc://chat.freenode.net/%23gentoo-multilib-overlay"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64"
SLOT="0"
IUSE="+development nodep"

RDEPEND="!nodep? ( app-emulation/emul-linux-x86-baselibs
	dev-db/myodbc[multilib_abi_x86]
	dev-db/mysql[multilib_abi_x86]
	dev-db/unixODBC[multilib_abi_x86] )"
