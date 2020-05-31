# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils git-r3

DESCRIPTION="Tools for people envious of nvidia's blob driver."
HOMEPAGE="https://github.com/envytools/envytools"
EGIT_REPO_URI="git://github.com/envytools/envytools.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+hwtest +nva +vdpau"

RDEPEND="
	dev-libs/libxml2
	hwtest? ( x11-libs/libpciaccess )
	nva? (
		x11-libs/libpciaccess
		x11-libs/libX11
		x11-libs/libXext
	)
	vdpau? (
		x11-libs/libpciaccess
		x11-libs/libX11
		x11-libs/libvdpau
	)
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	sys-devel/bison
	sys-devel/flex
"

src_configure() {
	local mycmakeargs=(
		-DDOC_PATH="${EPREFIX}/usr/share/doc/${PF}/"
		"$(cmake-utils_use_disable hwtest HWTEST)"
		"$(cmake-utils_use_disable nva NVA)"
		"$(cmake-utils_use_disable vdpau VDPOW)"
	)
	cmake-utils_src_configure
}
