# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit meson eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://anongit.freedesktop.org/git/virglrenderer.git"
	inherit git-r3
else
        SRC_URI="https://gitlab.freedesktop.org/virgl/${PN}/-/archive/${P}/${PN}-${P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DESCRIPTION="library used implement a virtual 3D GPU used by qemu"
HOMEPAGE="https://virgil3d.github.io/"

LICENSE="MIT"
SLOT="0"
IUSE="test"

RDEPEND=">=x11-libs/libdrm-2.4.50
	media-libs/libepoxy"

DEPEND="${RDEPEND}
	dev-util/meson
	test? ( >=dev-libs/check-0.9.4 )"

src_unpack() {
   unpack ${P}.tar.gz
   mv ${PN}-${P} ${P}
}


src_prepare() {
	default
	[[ -e configure ]] || eautoreconf
}

src_configure()  {
    local emesonargs=(
    $(meson_use test build-tests)
    )
    meson_src_configure
}
