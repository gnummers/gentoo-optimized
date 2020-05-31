# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic pax-utils

MY_PV="${PV/_/}"

P_FD="dosemu-freedos-1.0-bin"
COMMIT="15cfb41ff20a052769d753c3262c57ecb050ad71"

DESCRIPTION="DOS Emulator. It's an attempt to re-incarnate the famous dosemu project"
HOMEPAGE="https://stsp.github.io/dosemu2"
SRC_URI="https://codeload.github.com/stsp/${PN}/tar.gz/${MY_PV} -> ${P}.tar.gz
	mirror://sourceforge/dosemu/${P_FD}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="X svga gpm debug alsa fluidsynth ladspa"

RDEPEND="X? ( x11-libs/libX11
		x11-libs/libXxf86vm
		x11-libs/libXau
		x11-libs/libXext
		x11-libs/libXdmcp
		x11-apps/xset
		x11-apps/xlsfonts
		x11-apps/bdftopcf
		x11-apps/mkfontdir )
	svga? ( media-libs/svgalib )
	gpm? ( sys-libs/gpm )
	alsa? ( media-libs/alsa-lib )
	fluidsynth? ( media-sound/fluidsynth
		media-sound/fluid-soundfont )
	ladspa? ( media-libs/ladspa-cmt )
	media-libs/libao
	media-libs/libsdl2
	>=sys-libs/slang-1.4
	!app-emulation/dosemu"

DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
	sys-devel/bison
	sys-devel/flex
	>=sys-devel/autoconf-2.57"

S="${WORKDIR}/${PN}-${MY_PV}"

PATCHES=(
	"${FILESDIR}/fix-QA_notice.patch"
)

src_prepare() {
	default

	# Has problems with -O3 on some systems
	replace-flags -O[3-9] -O2

	# This one is from media-sound/fluid-soundfont (bug #479534)
	sed "s,/usr/share/soundfonts/default.sf2,${EPREFIX}/usr/share/sounds/sf2/FluidR3_GM.sf2,"\
		-i src/plugin/fluidsynth/mid_o_flus.c || die

	# see autogen.sh file
	einfo "Generating toplevel configure script..."
	AT_M4DIR="m4"
	eautoreconf
	./mkpluginhooks || die
	for dir in `cat plugin_configure`; do
		einfo "Generating configure script for $dir..."
		cd "${S}/${dir}"
		if [ -d m4 ]; then
			AT_M4DIR="m4 ${S}/m4"
		else
			AT_M4DIR="${S}/m4"
		fi
		eautoreconf
	done

	cd "${S}"
}

src_configure() {
	local myplugins=( libao,extra_charsets,term,sdl,charsets,console,modemu  )
	use alsa && myplugins+=( ,alsa )
	use fluidsynth && myplugins+=( ,fluidsynth,midimisc,munt )
	use ladspa && myplugins+=( ,ladspa )
	use gpm && myplugins+=( ,gpm )
	use svga && myplugins+=( ,svgalib )
	use X && myplugins+=( ,X )

	econf $(use_enable debug) \
		--with-fdtarball="${DISTDIR}/${P_FD}.tgz" \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		--enable-plugins="${myplugins}"
}

src_install() {
	default

	# r - randmmap: dosemu tries to get address mapping
	#     exactly where asked, loops otherwise.
	# m - allow RWX mapping: as it's an emulator / code loader
	pax-mark -mr "${ED}/usr/bin/dosemu.bin"
}
