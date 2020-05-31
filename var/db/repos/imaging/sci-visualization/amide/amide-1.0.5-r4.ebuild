# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils autotools

DESCRIPTION="AMIDE's a Medical Imaging Data Examiner"
HOMEPAGE="http://${PN}.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+gsl +xmedcon +fame +ffmpeg +volpack +vistaio +dicom debug doc +jpeg2k"

RDEPEND="
>=x11-libs/gtk+-2.10:2
gnome-base/libgnomecanvas
gnome-base/gnome-vfs
gnome-base/gconf
ffmpeg? ( >=media-video/ffmpeg-3.2.4 )
xmedcon? ( >=sci-misc/xmedcon-0.10 )
jpeg2k? ( media-libs/openjpeg:2 )
volpack? ( media-libs/volpack )
fame? ( media-libs/libfame )
gsl? ( sci-libs/gsl )
dicom? ( sci-libs/dcmtk )
vistaio? ( sci-libs/vistaio )
!media-gfx/amide
"

DEPEND="${RDEPEND}"

src_prepare () {
	if use vistaio -o use jpeg2k ; then
		epatch "${FILESDIR}/${PN}-1.0.5-jpeg2k.patch" &&
		epatch "${FILESDIR}/${PN}-1.0.5+jpeg2k-vistaio.patch"
		eautoreconf
	fi
	epatch "${FILESDIR}/${PN}-1.0.5-ffmpeg_2.9.patch"
	epatch "${FILESDIR}/${PN}-1.0.5-gsl_2x.patch"
	epatch "${FILESDIR}/${PN}-1.0.5-libc_2.23.patch"
	epatch "${FILESDIR}/${PN}-1.0.5-ffmpeg-encode.patch"
}

src_configure () {

	econf \
		$(use_enable gsl gsltest) \
		$(use_enable gsl libgsl) \
		$(use_enable xmedcon xmedcontest) \
		$(use_enable xmedcon libmdc) \
		$(use_enable fame libfametest) \
		$(use_enable fame libfame) \
                $(use_enable ffmpeg) \
		$(use_enable jpeg2k libopenjp2) \
		$(use_enable dicom libdcmdata) \
		$(use_enable volpack libvolpack) \
		$(use_enable vistaio vistaio) \
		$(use_enable debug amide-debug) \
		$(use_enable doc) \
		$(use_enable doc gtk-doc) \
		|| die "configure failed"
}

src_compile () {
	emake -j1 || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
