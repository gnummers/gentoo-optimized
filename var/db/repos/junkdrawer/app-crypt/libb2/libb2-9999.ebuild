# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools multilib-minimal

DESCRIPTION="library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp"
HOMEPAGE="https://blake2.net/"
if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/BLAKE2/${PN}"
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="CC0-1.0"
SLOT="0"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	[[ ${PV} == 9999 ]] && eautoreconf
	eapply_user
}

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
	$(use_enable static-libs static)
}

multilib_src_install() {
	find "${D}" -name '*.la' -delete || die
	default
}
