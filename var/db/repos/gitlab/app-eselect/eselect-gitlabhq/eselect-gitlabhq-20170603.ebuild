# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Manages multiple gitlabhq versions"
HOMEPAGE=""
#SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-admin/eselect-1.0.2"

src_unpack() {
	# need ${S} anyhow for src_install
	mkdir ${S}
	sed -e "s/@VERSION@/${PV}/" \
	    "${FILESDIR}/gitlabhq.eselect-${PVR}" \
	    > "${S}/gitlabhq.eselect" || die
}

src_install() {
	insinto /usr/share/eselect/modules
	doins "${S}/gitlabhq.eselect" || die
}
