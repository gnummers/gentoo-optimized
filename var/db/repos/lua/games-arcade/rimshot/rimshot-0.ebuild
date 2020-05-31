# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils games

DESCRIPTION="Nice application to work with drumbeats and play in 'Guitar Anti-Hero'"
HOMEPAGE="http://stabyourself.net/${PN}/"
SRC_URI="http://stabyourself.net/dl.php?file=${PN}/${PN}-source.zip -> ${P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

DEPEND=">=games-engines/love-0.8.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	default
	#it is only one .love file (but with a crappy name), so we can use asterisk
	mv *.love "${P}.zip"
	unpack "./${P}.zip"
	rm "${P}.zip"
}

src_prepare() {
	default
	# patch to work with love 0.8.0
	sed -r -e 's#(\trequire.*)(.lua)(.*)#\1\3#g' -i main.lua
	epatch_user
}

src_install() {
        local dir="${GAMES_DATADIR}/love/${PN}"
        insinto "${dir}"
        doins -r .
        doins -s scalable "${FILESDIR}/${PN}.svg"
        games_make_wrapper "${PN}" "love /usr/share/games/love/${P}"
        make_desktop_entry "${PN}"
        prepgamesdirs
}

pkg_postinst() {
        elog "${PN} savegames and configurations are stored in:"
        elog "~/.local/share/love/${PN}/"
}

