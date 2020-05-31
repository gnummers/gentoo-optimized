# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

SLOT="0"
LICENSE="HPND"
KEYWORDS="~amd64 ~x86 ~arm"
DESCRIPTION="Console SID file player. Very small and light."

SRC_URI="https://www.linuxunderground.be/distfiles/${P}.tar.gz"
HOMEPAGE="http://www-stud.rbi.informatik.uni-frankfurt.de/~sinsch/new/tinysid.htm"
IUSE="alsa"

RDEPEND="alsa? ( media-libs/alsa-oss )"

DEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i -e '/^C\?L\?D\?FLAGS/s:^:#:' makefile
}

src_install() {
	dobin tinysid

	ewarn "If you do not use OSS, you have to use an OSS wrapper."
	ewarn "I only tested alsa OSS wrapper."
	if use alsa; then
		ewarn "$ aoss tinysid my_sid_file.sid"
	fi
}
