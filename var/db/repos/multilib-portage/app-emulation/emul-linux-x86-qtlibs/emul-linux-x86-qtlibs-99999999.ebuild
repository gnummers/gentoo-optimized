# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Metapackage to provide 32bit libraries via multilib"
HOMEPAGE="http://www.gentoo.org/"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64"
SLOT="0"
IUSE="+development +dbus kde nodep opengl +qt3 +qt4 +svg +sql +webkit"

DEPEND="!nodep? ( opengl? ( app-admin/eselect-opengl ) )"

RDEPEND="!nodep? ( =app-emulation/emul-linux-x86-baselibs-${PV}
		=app-emulation/emul-linux-x86-soundlibs-${PV}
		=app-emulation/emul-linux-x86-xlibs-${PV}
		qt3? ( !qt4? ( x11-libs/qt:3[multilib_abi_x86] ) )
		qt4? ( dev-qt/qtcore:4[multilib_abi_x86]
			dev-qt/qtgui:4[multilib_abi_x86]
			svg? ( dev-qt/qtsvg:4[multilib_abi_x86] )
			sql? ( dev-qt/qtsql:4[multilib_abi_x86] )
			dev-qt/qtscript:4[multilib_abi_x86]
			dev-qt/qtxmlpatterns:4[multilib_abi_x86]
			dbus? ( dev-qt/qtdbus:4[multilib_abi_x86] )
			opengl? ( dev-qt/qtopengl:4[multilib_abi_x86] )
			!kde? ( || ( dev-qt/qtphonon:4[multilib_abi_x86] media-sound/phonon[multilib_abi_x86] ) )
			kde? ( media-sound/phonon[multilib_abi_x86] )
			qt3? ( dev-qt/qt3support:4[multilib_abi_x86] )
			webkit? ( dev-qt/qtwebkit:4[multilib_abi_x86] )
			dev-qt/qttest:4[multilib_abi_x86] )
	)"

pkg_postinst() {
	#update GL symlinks
	use opengl && eselect opengl set --use-old
}
