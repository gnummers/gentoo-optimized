# Copyright 2015 (Flex1911)
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Bootstrap a Debian system"
HOMEPAGE="https://tracker.debian.org/pkg/cdebootstrap"
SRC_URI="mirror://debian/pool/main/c/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~mips ~ppc ~ppc64 ~sparc"
IUSE=""

S="${WORKDIR}/cdebootstrap"

DEPEND="net-misc/wget
	app-arch/dpkg
	dev-libs/libdebian-installer"

src_install() {
	emake DESTDIR="${D}" install || die "make failed"
	dodoc doc/* debian/changelog debian/NEWS
}
