# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/kardianos/govendor"
EGIT_COMMIT="v${PV}"
DESCRIPTION="Go vendor tool that works with the standard vendor file."
HOMEPAGE="https://github.com/kardianos/govendor"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

inherit golang-vcs-snapshot golang-build

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_install() {
	dobin "govendor"
}
