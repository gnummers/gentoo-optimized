# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Google Cloud Messaging C library"
HOMEPAGE="https://github.com/doctaweeks/libgcm"
if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/doctaweeks/${PN}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/doctaweeks/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="static-libs"

DEPEND="dev-libs/json-c
	net-misc/curl"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable static-libs static)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	if ! use static-libs ; then
		find "${ED}" -name "*.la" -delete || die
	fi
}
