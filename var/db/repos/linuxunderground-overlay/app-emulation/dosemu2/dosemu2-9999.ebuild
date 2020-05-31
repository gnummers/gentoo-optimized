# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic pax-utils git-r3

P_FD="dosemu-freedos-1.0-bin"
COMMIT="15cfb41ff20a052769d753c3262c57ecb050ad71"

DESCRIPTION="DOS Emulator. It's an attempt to re-incarnate the famous dosemu project"
HOMEPAGE="https://stsp.github.io/dosemu2"
EGIT_REPO_URI="https://github.com/stsp/dosemu2.git"
EGIT_BRANCH="devel"
SRC_URI="fdbin? ( mirror://sourceforge/dosemu/${P_FD}.tgz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="X +sdl svga gpm debug experimental ao alsa fluidsynth ladspa fdbin"

RDEPEND="X? (
		x11-libs/libX11
		x11-libs/libXxf86vm
		x11-libs/libXau
		x11-libs/libXext
		x11-libs/libXdmcp
		x11-apps/xset
		x11-apps/xlsfonts
		x11-apps/bdftopcf
		x11-apps/mkfontdir
		)
	!fdbin? (
		app-emulation/comcom32-bin
		app-emulation/fdpp
		)
	svga? ( media-libs/svgalib )
	gpm? ( sys-libs/gpm )
	alsa? ( media-libs/alsa-lib )
	fluidsynth? (
		media-sound/fluidsynth
		media-sound/fluid-soundfont
		)
	ladspa? ( media-libs/ladspa-cmt )
	ao? ( media-libs/libao )
	sdl? ( media-libs/libsdl2[sound,video] )
	>=sys-libs/slang-1.4
	!app-emulation/dosemu"

DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
	sys-devel/bison
	sys-devel/flex
	>=sys-devel/autoconf-2.57"

src_prepare() {
	default

	# Has problems with -O3 on some systems
	replace-flags -O[3-9] -O2

	# This one is from media-sound/fluid-soundfont (bug #479534)
	sed "s,/usr/share/soundfonts/default.sf2,${EPREFIX}/usr/share/sounds/sf2/FluidR3_GM.sf2,"\
		-i src/plugin/fluidsynth/mid_o_flus.c || die

	# see autogen.sh file
	AT_M4DIR="m4"
	eautoreconf
}

src_configure() {
	local myplugins="extra_charsets,term,dosdrv,doscmd,periph,charsets,console,modemu"
	use sdl && myplugins+=",sdl"
	use ao && myplugins+=",libao"
	use alsa && myplugins+=",alsa"
	use fluidsynth && myplugins+=",fluidsynth,midimisc,munt"
	use ladspa && myplugins+=",ladspa"
	use gpm && myplugins+=",gpm"
	use svga && myplugins+=",svgalib"
	use X && myplugins+=",X"
	use debug && myplugins+=",debugger"
	use fdbin || myplugins+=",fdpp"

	local myconf=$(use_enable debug)
	myconf+=" --docdir=${EPREFIX}/usr/share/doc/${PF}"
	myconf+=" --enable-plugins=${myplugins}"
	use fdbin && myconf+=" --with-fdtarball=${DISTDIR}/${P_FD}.tgz"
	use experimental && myconf+=" --enable-experimental --enable-ubsan --disable-system-wa"

	econf ${myconf}
}

src_install() {
	default

	# r - randmmap: dosemu tries to get address mapping
	#     exactly where asked, loops otherwise.
	# m - allow RWX mapping: as it's an emulator / code loader
	pax-mark -mr "${ED}/usr/bin/dosemu.bin"

	dodoc BUGS CONTRIBUTING.md QuickStart NEWS README README.bindist THANKS TODO VERSION doc/*

	einfo "If you want non-X graphic console, try:"
	einfo "# USE=\"kms\" emerge -1 media-libs/libsdl2"
}
