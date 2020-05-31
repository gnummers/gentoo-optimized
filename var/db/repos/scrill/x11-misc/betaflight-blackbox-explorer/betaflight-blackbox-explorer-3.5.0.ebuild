# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils

DESCRIPTION="This tool allows you to open logs recorded by Betaflight's Blackbox feature"
HOMEPAGE="https://github.com/betaflight/blackbox-log-viewer"
SRC_URI="https://github.com/betaflight/blackbox-log-viewer/releases/download/${PV}/betaflight-blackbox-explorer_${PV}_linux64.zip"
LICENSE="GPL-3"
RESTRICT="mirror test"

SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""
QA_PREBUILT="*"
S=${WORKDIR}

SRC_APPDIR="${S}/Betaflight Blackbox Explorer"
DST_APPDIR="/opt/betaflight/betaflight-blackbox-explorer"

src_unpack() {
	unzip "${DISTDIR}/${A}" -d "${S}"
}

src_install() {
	dodir ${DST_APPDIR}
	cp -a "${SRC_APPDIR}"/* "${D}${DST_APPDIR}"/ || die
	domenu "${SRC_APPDIR}"/betaflight-blackbox-explorer.desktop
}
