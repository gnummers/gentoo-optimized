# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# TODOs:
#  - fix QA notice about installing symlinks in /usr/lib

EAPI=5

DESKTOP_VIDEO_SHORT_VERSION="10.9"
DESKTOP_VIDEO_VERSION="10.9a7"
MEDIA_EXPRESS_VERSION="3.5.3a1"

DESCRIPTION="Media Express - Blackmagic Design's tool for media capture, organization and playback"
HOMEPAGE="http://www.blackmagicdesign.com/"
HOMEPAGE_DOWNLOAD_NAME="Desktop Video ${DESKTOP_VIDEO_SHORT_VERSION}"

SRC_URI="Blackmagic_Desktop_Video_Linux_${DESKTOP_VIDEO_SHORT_VERSION}.tar.gz"
UNPACKED_DIR="mediaexpress-${MEDIA_EXPRESS_VERSION}-x86_64"

LICENSE="BlackmagicDesktopVideo"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="autostart"
RESTRICT="fetch"

# dependencies for binaries found by commands: (ldd lists transitive dependencies as well which isn't what we want)
# for file in /usr/lib/blackmagic/me/*; do objdump -p $file | grep NEEDED; done 2>/dev/null | cut -b24- | sort | uniq | grep -vE 'lib(Qt|MXF|DNxHDCodec)'
# equery belongs $(for file in /usr/lib/blackmagic/me/*; do objdump -p $file | grep NEEDED; done 2>/dev/null | cut -b24- | sort | uniq | grep -vE 'lib(Qt|MXF|DNxHDCodec)')

DEPEND=""
RDEPEND="${DEPEND}
	 >=media-libs/blackmagic-desktop-video-10.8.4

	 dev-libs/glib:2
	 media-libs/alsa-lib
	 media-libs/libpng:0/16
	 sys-devel/gcc
	 sys-libs/glibc
	 sys-libs/zlib
	 virtual/glu
	 x11-libs/libX11
	 x11-libs/libXext
	"

# supress QA warnings about stripping etc., i.e. stuff we cannot change since we install prebuilt binaries
QA_PREBUILT="opt/blackmagic-media-express/usr/lib/*"

pkg_nofetch() {
	einfo "Media Express is bundled with Desktop Video downloads."
	einfo ""
	einfo "Please visit ${HOMEPAGE} and download \"${HOMEPAGE_DOWNLOAD_NAME}\""
	einfo "for your product from the support section and move it to ${DISTDIR}"
	einfo ""
	einfo "  expected filename: ${SRC_URI}"
	einfo ""
	einfo "If your browser downloads a .tar file you will need to rename it to .tar.gz"
}

src_unpack() {
	unpack ${A}
	
	cd ${WORKDIR}
	tar xfz Blackmagic_Desktop_Video_Linux_${DESKTOP_VIDEO_VERSION}/other/x86_64/mediaexpress-${MEDIA_EXPRESS_VERSION}-x86_64.tar.gz
	
	# symlink to what is supposed to have been prepared
	ln -s ${UNPACKED_DIR} ${P}
}

src_install() {
	# all pre-built binaries should go into /opt and be symlinked to usr/bin etc.
	finalinstalldir="/opt/blackmagic-media-express"
	installdir="${D}${finalinstalldir}"
	
	mkdir -p ${installdir}
	cp -a ${WORKDIR}/${UNPACKED_DIR}/* ${installdir}/
	
	# NOTE: Not linking usr/lib/systemd as I don't use that and thus can't test it...
	symlinks=(
			'usr/bin/MediaExpress'
			'usr/lib/blackmagic/me'
			'usr/share/applications/MediaExpress.desktop'
			'usr/share/doc/mediaexpress'
			'usr/share/icons/hicolor/32x32/apps/MediaExpress.png'
			'usr/share/icons/hicolor/48x48/apps/MediaExpress.png'
			'usr/share/icons/hicolor/256x256/apps/MediaExpress.png'
                 )
	
	for path in "${symlinks[@]}"; do
		dosym ${finalinstalldir}/${path} ${path}
	done
	
	# dneuge: no clue on how to use this...
	## QA notice says we should generate a linker script if we don't place libraries in /usr/lib
	## see: https://devmanual.gentoo.org/eclass-reference/toolchain-funcs.eclass/index.html
	#gen_usr_ldscript usr/lib/libDeckLinkAPI.so usr/lib/libDeckLinkPreviewAPI.so

	# don't symlink man-pages, install a copy instead
	doman usr/share/man/man1/*.1
}

pkg_postinst() {
	#      12345678901234567890123456789012345678901234567890123456789012345678901234567890
	einfo "Please do *NOT* report any QA errors to Gentoo or Blackmagic!"
	einfo ""
	einfo "License can be found in: ${finalinstalldir}/usr/share/doc/mediaexpress/License.txt"
}
