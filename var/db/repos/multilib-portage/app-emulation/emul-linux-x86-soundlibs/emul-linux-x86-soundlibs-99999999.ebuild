# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Metapackage to provide 32bit libraries via multilib"
HOMEPAGE="http://www.gentoo.org/"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64"
SLOT="0"
IUSE="+development alsa nodep pulseaudio"

RDEPEND="!nodep? ( =app-emulation/emul-linux-x86-baselibs-${PV}
		=app-emulation/emul-linux-x86-medialibs-${PV}
		=app-emulation/emul-linux-x86-xlibs-${PV}
		dev-libs/liboil[multilib_abi_x86]
		media-libs/alsa-lib[multilib_abi_x86]
		media-libs/alsa-oss[multilib_abi_x86]
		media-libs/audiofile[multilib_abi_x86]
		media-libs/flac[multilib_abi_x86]
		media-libs/libmikmod[multilib_abi_x86]
		media-libs/libmodplug[multilib_abi_x86]
		media-libs/libogg[multilib_abi_x86]
		media-libs/libsndfile[multilib_abi_x86]
		media-libs/libvorbis[multilib_abi_x86]
		media-libs/portaudio[multilib_abi_x86]
		media-sound/jack-audio-connection-kit[multilib_abi_x86]
		pulseaudio? ( media-sound/pulseaudio[multilib_abi_x86] ) )"

S=${WORKDIR}

src_install() {
	if use alsa; then
		# Install /usr/bin/aoss32 like
		# emul-linux-x86-soundlibs-20120127. Assume that
		# media-libs/alsa-oss[multilib_abi_x86] has been (re)installed
		# after >=sys-apps/portage-2.2.0_alpha95-r1.
		dosym aoss-x86 /usr/bin/aoss32
	fi
}

pkg_postinst() {
	if use alsa && ! [[ -e ${EROOT}usr/bin/aoss-x86 ]]; then
		ewarn "You need to reinstall media-libs/alsa-oss after upgrading"
		ewarn "to >=sys-apps/portage-2.2.0_alpha95-r1 in order to create"
		ewarn "${EROOT}usr/bin/aoss-x86 (used by aos32)."
	fi
}
