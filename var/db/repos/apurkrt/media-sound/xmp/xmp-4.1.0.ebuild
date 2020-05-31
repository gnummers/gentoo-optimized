# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Extended Module Player CLI"
HOMEPAGE="http://xmp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="alsa oss pulseaudio"

RDEPEND="alsa? ( >=media-libs/alsa-lib-1.0.27.2 )
	pulseaudio? ( >=media-sound/pulseaudio-5.0 )"
DEPEND="${RDEPEND}
	>=media-libs/libxmp-4.4.1
	oss? ( virtual/os-headers )"

src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		$(use_enable alsa) \
		$(use_enable oss) \
		$(use_enable pulseaudio)
}
