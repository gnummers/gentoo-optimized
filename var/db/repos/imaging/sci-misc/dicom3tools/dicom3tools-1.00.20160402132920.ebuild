# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils versionator

MY_PV="$(get_version_component_range 1-2 $PV).snapshot.$(get_version_component_range 3 $PV)"
S="${WORKDIR}/${PN}_${MY_PV}"

DESCRIPTION="Command line utilities for manipulating and convertin DICOM files"
HOMEPAGE="http://www.dclunie.com/dicom3tools.html"
SRC_URI="http://www.dclunie.com/dicom3tools/workinprogress/${PN}_${MY_PV}.tar.bz2"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="x11-libs/libX11
		 x11-libs/libXext"

DEPEND="$RDEPEND
		x11-misc/imake"

PATCHES=(
	"${FILESDIR}/detect_gcc_version.patch"
	"${FILESDIR}/project.tmpl.patch"
	"${FILESDIR}/pvrg_naming.patch"
	"${FILESDIR}/codeblockstylefix.patch"
	"${FILESDIR}/strip.patch"
)

src_prepare() {
	[[ ${PATCHES[@]} ]] && epatch "${PATCHES[@]}"
	debug-print "$FUNCNAME: applying user patches"
	epatch_user
}

src_configure() {
	sh Configure
	imake -I./config -DTmpPath=/tmp -DOptimizeLevel=-O2
}

src_compile() {
	emake World C_DEBUGFLAGS="$(CFLAGS)" CPLUSPLUS_DEBUGFLAGS="$(CXXFLAGS)"\
		  C_EXTRA_LOAD_FLAGS="$(LDFLAGS)" CPLUSPLUS_EXTRA_LOAD_FLAGS="$(LDFLAGS)"
}
