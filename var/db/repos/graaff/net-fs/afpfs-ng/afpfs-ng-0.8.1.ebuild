# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="AFP filesystem clients"
HOMEPAGE="http://sourceforge.net/projects/${PN}/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="crypt fuse readline"

DOCS="ChangeLog docs/README NEWS"

RDEPEND="
	crypt? ( >=dev-libs/libgcrypt-1.4.0 dev-libs/gmp )
	fuse? ( >=sys-fs/fuse-2.7.0 )
	readline? ( sys-libs/readline )"

src_prepare() {
	sed -i -e 's/$echo/$ECHO/' ltmain.sh || die
	eautoreconf
}

src_configure() {
	# TODO: make USE flags not automagic.
	econf --disable-static
}
