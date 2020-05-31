# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cargo

CARGO_FETCH_CRATES=yes

DESCRIPTION="md cat"
HOMEPAGE="https://github.com/lunaryorn/mdcat"
SRC_URI="https://github.com/lunaryorn/mdcat/archive/mdcat-${PV}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${P}"
