# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils

DESCRIPTION="Application for JESC firmware flashing and configuration"
HOMEPAGE="https://github.com/jflight-public/jesc-configurator"
SRC_URI="https://github.com/jflight-public/jesc-configurator/releases/download/v${PV}/JESC-Configurator_linux64_${PV}.zip"
LICENSE="GPL-3"
RESTRICT="mirror test"

SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""
QA_PREBUILT="*"
S=${WORKDIR}

SRC_APPDIR="${S}/JESC Configurator"
DST_APPDIR="/opt/jesc-configurator"

src_unpack() {
	unzip "${DISTDIR}/${A}" -d "${S}"
}

src_install() {
	dodir ${DST_APPDIR}
	cp -a "${SRC_APPDIR}"/* "${D}${DST_APPDIR}"/ || die

	local res
	for res in 16 32 64 128 256 512; do
		doicon -s $res "${FILESDIR}"/jesc-configurator.png
	done

	domenu "${FILESDIR}"/jesc-configurator.desktop
}
