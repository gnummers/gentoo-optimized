# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/NebulousLabs/Sia"

inherit eutils golang-build user systemd

DESCRIPTION="A decentralized cloud storage platform based on blockchain technology"
HOMEPAGE="https://sia.tech"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	dev-lang/go
"

RDEPEND="${DEPEND}"

SIA_USER="sia"

pkg_setup() {
	enewuser "${SIA_USER}"
}

src_prepare() {
	eapply_user
	# TODO: Writing ebuilds for golang packages is not easy. Or in
	# other words: go packaging suckz! The naive approach here will
	# violate
	# FEATURES="network-sandbox"
	# since "make dependencies" fetches go packages.

	local rel_sia_path="src/github.com/NebulousLabs/Sia"
	mkdir -p "${rel_sia_path}" || die
	mv * "${rel_sia_path}"
	cd "${rel_sia_path}" || die

	# Zap a few dependencies not required to build Sia
	sed -i '/lint\/golint/d' Makefile || die
	sed -i '/go install -race std/d' Makefile || die
	sed -i '/NebulousLabs\/glyphcheck/d' Makefile || di

	export GOPATH="${S}:$(get_golibdir_gopath)"
	make dependencies
}

src_compile() {
	export GOPATH="${S}:$(get_golibdir_gopath)"
	cd src/${EGO_PN} || die

	emake release-std
}

src_install() {
	dobin bin/siad bin/siac

	local sia_directory="/var/lib/${SIA_USER}"
	dodir "${sia_directory}"
	fperms 700 "${sia_directory}"
	fowners "${SIA_USER}" "${sia_directory}"

	systemd_dounit "${FILESDIR}/${PN}.service"
}
