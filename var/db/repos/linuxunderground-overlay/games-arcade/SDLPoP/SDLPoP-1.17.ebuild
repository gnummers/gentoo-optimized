# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/NagyD/${PN}.git"
	inherit git-r3
	SRC_URI=""
else
	SRC_URI="https://codeload.github.com/NagyD/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

SLOT="0"
LICENSE="GPL-3"
DESCRIPTION="Open-source port of Prince of Persia, based on the disassembly of DOS version."

HOMEPAGE="http://www.princed.org/"

IUSE="haptic"
DOCS=( doc/Readme.txt doc/ChangeLog.txt doc/bugs.txt doc/mod.ini )

RDEPEND="media-libs/sdl2-image
	media-libs/sdl2-mixer
	haptic? ( media-libs/libsdl2[haptic] )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/src"

src_prepare() {
	sed -i \
		-e 's:"SDLPoP.ini":"/usr/share/SDLPoP/SDLPoP.ini":' \
		options.c || die
	sed -i \
		-e 's:"data/icon.png:"/usr/share/pixmaps/SDLPoP.png:' \
		-e 's:"data/:"/usr/share/SDLPoP/data/:' \
		-e 's:"mods/:"/usr/share/SDLPoP/mods/:' \
		seg009.c || die
	sed -i \
		-e 's:#include_directories(${DIR_SDL2}/include):include_directories(/usr/include/SDL2):' \
		CMakeLists.txt || die
	cd ..
	use haptic || eapply "${FILESDIR}"/disable_haptic-1.17.patch
	eapply_user
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cd ..

	mv data/icon.png "${PN}.png" || die
	doicon "${PN}.png"
	make_desktop_entry "prince" "Prince of Persia" "${PN}"

	insinto /usr/share/${PN}
	doins SDLPoP.ini
	doins -r data
	doins -r mods

	dobin prince
}
