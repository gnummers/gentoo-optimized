# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="ALICE simullation and reconstruction framework"
HOMEPAGE="https://aliweb.cern.ch"

CMAKE_BUILD_TYPE=RELWITHDEBINFO
inherit cmake-utils eapi7-ver

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/alisw/AliRoot.git"
	SLOT=0
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/alisw/AliRoot/archive/v$(ver_cut 1)-$(ver_cut 2)-$(ver_cut 3).tar.gz"
	SLOT="$(ver_cut 1-2)/$(ver_cut 3)"
fi

LICENSE=""
IUSE=""

DEPEND="sci-physics/root"
RDEPEND="${DEPEND}"

ALICE_ROOT="${EPREFIX%/}/opt/${PN}/${PV}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${ALICE_ROOT}"
		-DROOTSYS=`root-config --prefix`
		-DALIROOT_ONLINE_MODE=ON
		"${EXTRA_ECONF}"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	newenvd - 9999aliroot-${PV} <<-EOF
		ALICE_ROOT="${ALICE_ROOT}"
		PATH="${ALICE_ROOT}/bin"
		LDPATH="${ALICE_ROOT}/lib"
	EOF
}
