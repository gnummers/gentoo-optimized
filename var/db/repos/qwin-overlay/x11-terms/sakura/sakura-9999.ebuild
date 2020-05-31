# Copyright 2015 (Flex1911)

EAPI=5
inherit cmake-utils eutils bzr

DESCRIPTION="sakura is a terminal emulator based on GTK and VTE"
HOMEPAGE="http://www.pleyades.net/david/projects/sakura/"
SRC_URI=""
EBZR_REPO_URI="http://code.launchpad.net/sakura"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="
	>=dev-libs/glib-2.20:2
	>=x11-libs/vte-0.28:2.90
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5.10.1
	virtual/pkgconfig
"

DOCS=( AUTHORS INSTALL )

src_prepare() {
	sed -i "/FILES INSTALL/d" CMakeLists.txt || die

	strip-linguas -i po/
	local lingua
	for lingua in po/*.po; do
		lingua="${lingua/po\/}"
		lingua="${lingua/.po}"
		if ! has ${lingua} ${LINGUAS}; then
			rm po/${lingua}.po || die
		fi
	done

	cmake-utils_src_prepare
}
