# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MIN_VERSION=3.11

COMMIT=097d9806ffab9120f078bea22e9b49502807786b

inherit elisp cmake-utils

DESCRIPTION="Emacs libvterm integration"
HOMEPAGE="https://github.com/akermu/emacs-libvterm"
SRC_URI="https://github.com/akermu/emacs-libvterm/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"

DEPEND="
	>=app-editors/emacs-26:*[dynamic-loading]
	dev-libs/libvterm
"
RDEPEND=${DEPEND}

S="${WORKDIR}/${PN}-${COMMIT}"

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBVTERM=ON
	)
	cmake-utils_src_configure
	elisp_src_configure
}

src_compile() {
	cmake-utils_src_compile
	elisp_src_compile
}

src_install() {
	elisp_src_install
	elisp-install ${PN} vterm-module.so
}
