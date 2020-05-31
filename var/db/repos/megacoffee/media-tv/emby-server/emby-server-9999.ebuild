# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils user git-r3

DESCRIPTION="Emby Server (formerly known as MediaBrowser Server) is a software that indexes a lot of different kinds of media and allows for them to be retrieved and played through the DLNA protocol on any device capable of processing them."
HOMEPAGE="http://emby.media/"
KEYWORDS="-* ~9999"
EGIT_REPO_URI="https://github.com/MediaBrowser/Emby/"
EGIT_BRANCH="dev"
SLOT="0"
LICENSE="GPL-2"
IUSE=""
RESTRICT="mirror test"

RDEPEND=">=dev-lang/mono-3.2.7
	>=media-video/ffmpeg-2[vpx]
	>=media-libs/libmediainfo-0.7
	media-gfx/imagemagick[jpeg,jpeg2k,webp,png]
	!media-tv/mediabrowser-server"
DEPEND="app-arch/unzip ${RDEPEND}"

INSTALL_DIR="/opt/emby-server"
DATA_DIR="/usr/lib/emby-server"
STARTUP_LOG="/var/log/emby-server_start.log"
INIT_SCRIPT="${ROOT}/etc/init.d/emby-server"

src_prepare() {
        MAGICKWAND=$(ldconfig -p | grep MagickWand.*.so$ | cut -d" " -f4)
        MAGICKWAND=${MAGICKWAND##*/}
        einfo "adapting to imagemagick library: ${MAGICKWAND}"
        sed -i -e "s/\"libMagickWand-6.Q8.so\"/\"${MAGICKWAND}\"/" MediaBrowser.Server.Mono/ImageMagickSharp.dll.config || die "could not update libMagickWand reference!"
}

src_compile() {
	einfo "updating root certificates for mono certificate store"
	mozroots --import --sync
	einfo "now actually compile"
	xbuild /p:Configuration="Release Mono" /p:Platform="Any CPU" MediaBrowser.Mono.sln || die "building failed"
}

src_install() {
	einfo "preparing startup scripts"
	newinitd "${FILESDIR}"/initd_1  ${PN}
	dodir /var/log/
	touch ${D}${STARTUP_LOG}
	chown emby:emby ${D}${STARTUP_LOG}

	einfo "installing compiled files"
	diropts -oemby -gemby
	dodir ${INSTALL_DIR}
	cp -R ${S}/MediaBrowser.Server.Mono/bin/Release\ Mono/* ${D}${INSTALL_DIR}/ || die "install failed, possibly compile did not succeed earlier?"
	chown emby:emby -R ${D}${INSTALL_DIR}

	# as we use the system libraries, we delete the local ones now as we couldn't do it before
	rm -R ${D}${INSTALL_DIR}/libwebp
	rm -R ${D}${INSTALL_DIR}/MediaInfo

	einfo "prepare data directory"
	dodir ${DATA_DIR}
}

pkg_setup() {
	einfo "creating user for Emby"
	enewgroup emby
	enewuser emby -1 /bin/bash ${INSTALL_DIR} "emby" --system
}

pkg_prerm() {
	einfo "Stopping running instances of Emby Server"
	if [ -e "${INIT_SCRIPT}" ]; then
		${INIT_SCRIPT} stop
	fi
}

pkg_postinst() {
	einfo "emby-server was installed to ${INSTALL_DIR}, to start please use the init script provided."
	einfo "All data generated and used by Emby can be found at ${DATA_DIR} after the first start."
	einfo ""
	ewarn "ATTENTION: If you moved from the former mediabrowser-server package don't forget to  migrate"
	ewarn "your original data directory before the first start! To do that move"
	ewarn "     /usr/lib/mediabrowser-server"
	ewarn "to"
	ewarn "     /usr/lib/emby-server"
	ewarn "and change owner status from mediabrowser:mediabrowser to emby:emby!"
	ewarn "     chown -R emby:emby /usr/lib/emby-server"
}
