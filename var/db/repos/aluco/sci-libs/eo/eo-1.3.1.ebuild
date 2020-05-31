# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

MY_P="EO-${PV}"

DESCRIPTION="Evolving Objects library: an Evolutionary Computation Framework"
HOMEPAGE="http://eodev.sourceforge.net/"
SRC_URI="mirror://sourceforge/eodev/${MY_P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}
app-arch/unzip"

S="${WORKDIR}/${PN}"

src_install() {
	cmake-utils_src_install

	dodoc "${S}"/{AUTHORS,CHANGELOG,NEWS,README,THANKS,ToDo}

	if use doc ; then
		dohtml "${S}"/tutorial/*
	fi
}
