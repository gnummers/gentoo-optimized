# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/golang/dep"
EGIT_COMMIT="v${PV}"
DESCRIPTION="Go dependency management tool"
HOMEPAGE="https://golang.github.io/dep/"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

inherit golang-vcs-snapshot golang-build

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_install() {	
	cd src/github.com/golang/dep
	GOPATH=${S} go install -ldflags="-X main.version=${PV}" ./cmd/dep
	dobin ${WORKDIR}/dep-${PV}/bin/dep
}
