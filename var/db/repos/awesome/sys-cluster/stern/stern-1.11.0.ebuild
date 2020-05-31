# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/wercker/stern"
EGIT_COMMIT="${PV}"
DESCRIPTION="Multi pod and container log tailing for Kubernetes"
HOMEPAGE="https://github.com/wercker/stern"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

inherit golang-vcs-snapshot golang-build

RESTRICT="network-sandbox"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go
		>=dev-go/govendor-1.0.9"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	cd "src/${EGO_PN}"
	GOPATH=${S} govendor sync -v
}

src_install() {
	dobin stern
}
