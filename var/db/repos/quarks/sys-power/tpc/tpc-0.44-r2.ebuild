# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="TurionPowerControl is a command line tool that allows users to
tweak AMD processors parameters."
HOMEPAGE="https://github.com/turionpowercontrol/tpc"
SRC_URI="https://github.com/turionpowercontrol/tpc/archive/${P}-rc2.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S="${WORKDIR}/tpc-${P}-rc2"

src_install () {
	dosbin TurionPowerControl
}
