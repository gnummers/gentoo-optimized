EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit eutils python-r1

MY_PV=03

DESCRIPTION="russian fido-like messaging system with web interface"
HOMEPAGE="http://ii-net.tk/"
SRC_URI="http://ii-net.tk/files/iiclient-${MY_PV}.tar.gz
	http://ii-net.tk/files/ii-${MY_PV}.tar.gz
	http://ii-net.tk/files/iitxt-${MY_PV}.tar.gz
	http://ii-net.tk/files/scripts.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="*"

RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
IUSE="python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

S="${WORKDIR}"

src_prepare() {
mv iiclient-${MY_PV} ii-client
mv ii-${MY_PV} ii-server
mv iitxt-${MY_PV} ii-txt
}

src_install() {
dodir /usr/share/ii-net/

cp -rf ${S}/ii-client ${D}/usr/share/ii-net
cp -rf ${S}/ii-server ${D}/usr/share/ii-net
cp -rf ${S}/ii-txt ${D}/usr/share/ii-net

dobin scripts/ii-client
dobin scripts/ii-point
dobin scripts/ii-server
dobin scripts/ii-txt
}


