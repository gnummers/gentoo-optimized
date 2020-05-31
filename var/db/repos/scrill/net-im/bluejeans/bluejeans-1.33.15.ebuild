# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit rpm

DESCRIPTION="Online meetings, video conferencing, and screen sharing for teams of any size"
HOMEPAGE="https://www.bluejeans.com"
SRC_URI="http://swdl.bluejeans.com/desktop/linux/1.33/1.33.15/bluejeans-1.33.15.x86_64.rpm"

LICENSE="BlueJeans"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

src_unpack() {
  rpm_src_unpack ${A}
}

src_install() {
  cp -R "${S}/"* "${D}/" || die "Install failed!"

  local res
  for res in 16 24 32 256; do
    newicon -s ${res} opt/${PN}/icons/hicolor/${res}x${res}/apps/${PN}.png ${PN}.png
  done

  fperms +x /opt/${PN}/${PN}
  fperms +x /opt/${PN}/${PN}-bin

  dosym /opt/${PN}/${PN} /opt/bin/${PN}
  dosym /opt/${PN}/${PN}-bin /opt/bin/${PN}-bin
  dosym /usr/lib/libudev.so /opt/${PN}/libudev.so.0

  domenu opt/${PN}/${PN}.desktop
}
