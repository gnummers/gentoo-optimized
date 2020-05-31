# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info eutils autotools

DESCRIPTION="Console-based audio visualizer for Alsa (MPD and Pulseaudio)"
HOMEPAGE="https://github.com/karlstav/cava"
SRC_URI="https://github.com/karlstav/cava/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="dev-libs/iniparser:0
	sci-libs/fftw:3.0
	sys-libs/ncurses:="
RDEPEND="${DEPEND}"

DOCS="README.md"

CONFIG_CHECK=(
	SND_ALOOP
)

src_prepare() {
	rm --recursive --force iniparser/src || die
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug ) \
		--enable-legacy_iniparser \
		--docdir="${EREFIX}"/usr/share/doc/${PF}
}

src_compile() {
	emake SYSTEM_LIBINIPARSER=1 VERSION=${PV}
}

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX=/usr SYSTEM_LIBINIPARSER=1 install
}
