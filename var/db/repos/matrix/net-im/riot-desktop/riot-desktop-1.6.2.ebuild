# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://riot.im"

inherit unpacker xdg-utils

SRC_URI="https://github.com/vector-im/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vector-im/riot-web/archive/v${PV}.tar.gz -> riot-web-${PV}.tar.gz"
KEYWORDS="~amd64"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="+emoji"
REQUIRED_USE=""

RESTRICT="network-sandbox"

RDEPEND="app-accessibility/at-spi2-atk:2
	dev-db/sqlcipher
	dev-libs/atk
	dev-libs/expat
	dev-libs/nspr
	dev-libs/nss
	>=net-libs/nodejs-12.14.0
	net-print/cups
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libXScrnSaver
	x11-libs/pango
	emoji? ( media-fonts/noto-emoji )"
DEPEND="${RDEPEND}"
BDEPEND="sys-apps/yarn
	virtual/rust"

QA_PREBUILT="
	/opt/Riot/chrome-sandbox
	/opt/Riot/crashpad_handler
	/opt/Riot/riot-desktop
	/opt/Riot/libEGL.so
	/opt/Riot/libGLESv2.so
	/opt/Riot/libffmpeg.so
	/opt/Riot/libvk_swiftshader.so
	/opt/Riot/swiftshader/libEGL.so
	/opt/Riot/swiftshader/libGLESv2.so"

RIOT_WEB_S="${WORKDIR}/riot-web-${PV}"

src_prepare() {
	default
	pushd "${RIOT_WEB_S}" >/dev/null || die
	yarn install || die
	cp config.sample.json config.json || die

	popd || die
	yarn install || die
}

src_compile() {
	pushd "${RIOT_WEB_S}" >/dev/null || die
	yarn build || die

	popd || die
	ln -s "${RIOT_WEB_S}"/webapp ./ || die
	yarn build:native || die
	yarn build || die
}

src_install() {
	unpack dist/${PN}_${PV}_amd64.deb
	tar -xvf data.tar.xz || die

	./node_modules/asar/bin/asar.js p webapp opt/Riot/resources/webapp.asar || die
	mv usr/share/doc/${PN} usr/share/doc/${PF} || die
	gunzip usr/share/doc/${PF}/changelog.gz || die

	insinto /
	doins -r usr
	doins -r opt
	local f
	for f in ${QA_PREBUILT}; do
		fperms +x "${f}"
	done
	dosym ../../opt/Riot/${PN} /usr/bin/${PN}
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update

	elog "Since upgrading Riot to Electron 8 it uses StatusNotifierItem"
	elog "for displaying the tray icon."
	elog "Some popular status bars do not support the new API."
	elog
	elog "If you have problems with showing the tray icon, consider installing"
	elog "x11-misc/snixembed."
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
