# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Library for in and output of landmarks"
HOMEPAGE="http://mia.sf.net/"
SRC_URI="mirror://sourceforge/mia/mialm-${PV}.tar.xz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPENDS="app-arch/xz-utils
		${RDEPENDS}
	"

RDEPENDS="dev-libs/glib:2
           dev-libs/libxml2
	"
