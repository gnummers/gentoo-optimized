# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A Qt5 library to write cross-platform clients for Matrix"
HOMEPAGE="https://gitlab.com/b0/sortfilterproxymodel"

PATCHES=( "${FILESDIR}"/sortfilterproxymodel-libdir.patch )

inherit eutils qmake-utils

if [[ ${PV} == "9999" ]]; then
	inherit git-r3

	SRC_URI=""
	EGIT_REPO_URI="https://gitlab.com/b0/${PN}.git"
else
	SRC_URI="https://gitlab.com/b0/${PN}/-/archive/${PV}/${PN}.tar.gz -> ${P}.tar.gz"	
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-qt/qtquickcontrols
	dev-qt/qtquickcontrols2"
DEPEND="${RDEPEND}
	dev-qt/qtcore
	dev-qt/qtdeclarative"

src_configure() {
	eqmake5 \
		PREFIX=/usr \
		LIB_DIR=/usr/$(get_libdir)/
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
