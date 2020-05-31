# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Rotter is a Recording of Transmission / Audio Logger for JACK"
HOMEPAGE="http://www.aelius.com/njh/rotter/"
if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/njh/rotter"
else
	SRC_URI="https://github.com/njh/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="mp3 sndfile twolame"

DEPEND="media-sound/jack-audio-connection-kit
		mp3? ( media-sound/lame )
		sndfile? ( media-libs/libsndfile )
		twolame? ( media-sound/twolame )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-0.9-manpage.diff" )

src_prepare() {
	default
	eautoreconf
}
