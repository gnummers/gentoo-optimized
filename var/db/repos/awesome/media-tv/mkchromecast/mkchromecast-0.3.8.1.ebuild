# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit unpacker

DESCRIPTION="Cast macOS and Linux Audio/Video to your Google Cast and Sonos Devices"
HOMEPAGE="http://mkchromecast.com"
SRC_URI="https://github.com/muammar/${PN}/releases/download/${PV}/${PN}_${PV}-1_all.deb"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ffmpeg qt"

DEPEND="dev-python/pychromecast
		media-sound/pulseaudio
		dev-python/psutil
		media-sound/pavucontrol
		media-libs/mutagen
		dev-python/flask
		media-sound/vorbis-tools
		media-sound/sox
		media-sound/lame
		media-libs/flac
		ffmpeg? ( media-video/ffmpeg[vorbis] )
		qt? ( dev-python/PyQt5 )
		net-misc/youtube-dl"
RDEPEND="${DEPEND}"
BDEPEND=""

S=$WORKDIR

src_unpack() {
	unpack_deb ${A}
}

src_install() {

	# Uncompress files for decompress-ed dirs
	gunzip usr/share/doc/mkchromecast/*.gz
	gunzip usr/share/man/man1/*.gz

	dodoc -r usr/share/doc
	insinto /usr/share/
	doins -r usr/share/applications
	doins -r usr/share/mkchromecast
	doins -r usr/share/pixmaps
	doman usr/share/man/man1/mkchromecast.1
	dosym /usr/share/mkchromecast/mkchromecast.py /usr/bin/mkchromecast
	fperms 0755 /usr/share/mkchromecast/mkchromecast.py
}
