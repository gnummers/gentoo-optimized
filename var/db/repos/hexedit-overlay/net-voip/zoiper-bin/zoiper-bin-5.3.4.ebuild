# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Free VoIP softphone for non-commercial use"
HOMEPAGE="www.zoiper.com"
SRC_URI="zoiper5_${PV}_x86_64.tar.xz"
SRC_DL_URL="https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pulseaudio"
RESTRICT="fetch binchecks bindist strip"

DEPEND=""
RDEPEND="${DEPEND}
	pulseaudio? ( media-sound/pulseaudio )
	app-crypt/mit-krb5
	dev-libs/atk
	dev-libs/glib
	media-libs/freetype
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libnotify
	x11-libs/libXScrnSaver"
BDEPEND=""

S="${WORKDIR}"

pkg_nofetch()
{
	einfo "Please download"
	for dist in ${A[@]}; do
		einfo " - $dist"
	done
	einfo "from $SRC_DL_URL"
	einfo "and place them into your DISTDIR"
}

src_install() {
	insinto /opt
	doins -r Zoiper5
	fperms 0755 /opt/Zoiper5/zoiper
	insinto /usr/share/pixmaps
	doins ${FILESDIR}/zoiper.png
	insinto /usr/share/applications
	doins ${FILESDIR}/zoiper.desktop
	doins ${FILESDIR}/zoiper.png
}
