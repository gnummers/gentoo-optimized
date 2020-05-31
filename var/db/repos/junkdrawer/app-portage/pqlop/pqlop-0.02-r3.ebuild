# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit eutils python-r1

DESCRIPTION="emerge.log parser written in python"
HOMEPAGE="https://bitbucket.org/LK4D4/pqlop"
SRC_URI="https://bitbucket.org/LK4D4/pqlop/raw/${PV}/pqlop.py -> ${P}.py"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}"/${P}.py "${S}"/${PN}.py
}

src_prepare() {
	default
	epatch "${FILESDIR}"/${P}-years-fix.diff
}

src_install() {
	newbin ${PN}.py ${PN} || die "newbin failed"
	python_replicate_script "${ED}"/usr/bin/${PN} || die "python_replicate_script failed"
}
