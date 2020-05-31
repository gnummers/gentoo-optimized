# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils gnome2-utils

DESCRIPTION="A simple medical imaging visualization tool"
HOMEPAGE="https://github.com/neurolabusc/MRIcroGL"
SRC_URI="https://github.com/neurolabusc/MRIcroGL/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="dev-lang/fpc
	>=dev-lang/lazarus-1.6.2[python]"

S="${WORKDIR}/MRIcroGL-${PV}"

src_compile() {
	# Python support will only be vaialable for the default implementation:
	# https://github.com/neurolabusc/MRIcroGL/issues/30#issuecomment-423216197
	cp -rf /etc/lazarus system-lazarus-config
	lazbuild -B --lazarusdir="/usr/share/lazarus/" --pcp="system-lazarus-config" simplelaz.lpi || die
}

src_install() {
	dobin MRIcroGL

	insinto /usr/share/mricrogl
	doins -r lut script shaders

	doicon -s scalable mricrogl.svg
	make_desktop_entry MRIcroGL MRIcroGL /usr/share/icons/hicolor/scalable/apps/mricrogl.svg
}

pkg_postinst() {
	gnome2_icon_cache_update
}
pkg_postrm() {
	gnome2_icon_cache_update
}
