# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Simple background setter based on imlib2"
HOMEPAGE="https://github.com/Gottox/bgs"
SRC_URI="https://github.com/Gottox/bgs/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama"

DEPEND="media-libs/imlib2
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -e 's/PREFIX = \/usr\/local/PREFIX = \/usr/' -i config.mk || die

	if use xinerama; then
		sed -e '/XINERAMALIBS/d' -i config.mk || die
		sed -e '/XINERAMAFLAGS/d' -i config.mk || die
	fi
}
