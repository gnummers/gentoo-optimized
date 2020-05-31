# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd toolchain-funcs user

DESCRIPTION="torguard anonymous VPN - NOT related to TOR project"
HOMEPAGE="https://torguard.net"
SRC_URI="https://updates.torguard.biz/Software/Linux/torguard-v${PV}-amd64-arch.tar.gz -> ${P}.tar.gz
		x86?	( https://updates.torguard.biz/Software/Linux/torguard-v${PV}-i386-arch.tar.gz -> ${P}.tar.gz )"

LICENSE="custom"
SLOT="0"
# KEYWORDS="~amd64 ~x86"
KEYWORDS="~amd64"
IUSE="sudo"
RDEPEND="sys-apps/iproute2
		net-vpn/openvpn[iproute2]
		dev-qt/qtwidgets
		dev-qt/qtnetwork[libproxy]
		net-proxy/shadowsocks-libev
		sudo? ( lxqt-base/lxqt-sudo )"
DEPEND="${RDEPEND}"

# S=${WORKDIR}/${PN}-v${PV}-amd64-arch
S="${WORKDIR}/${PN}-v${PV}-amd64-arch/${PN}-v${PV}-amd64-arch"
# S=${WORKDIR}/${PN}-v${PV}-amd64-arch

pkg_setup() {
	# enewgroup <name> [gid]
	enewgroup ${PN}
	# enewuser <user> [uid] [shell] [homedir] [groups]
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_unpack() {
	default
	# cd "${S}" || die "Couldn't cd into the source directory ${S}"
	cd "${WORKDIR}/${PN}-v${PV}-amd64-arch" || die "Couldn't cd into the source directory ${S}"
	# TODO: fix x86 installation :(
	# tar xpf ${PN}-v${PV}-amd64-arch.tar || die "tar failed"
	unpack ./${PN}-v${PV}-amd64-arch.tar || die "tar failed"
}

src_prepare() {
	default
	# We are not using the bundled libs
	sed -i 's/^export.*$//' "${S}/opt/${PN}/bin/${PN}-wrapper"
}

src_install() {
	doins -r "${S}/usr"
	newbin "${S}/opt/${PN}/bin/${PN}-wrapper" "${PN}"

	insinto /opt/${PN}/bin/
	insopts -m755
	doins -r "${S}/opt/${PN}/bin/${PN}"
	doins "${S}/opt/${PN}/bin/openconnect"
	doins "${S}/opt/${PN}/bin/vpnc-script"

	# torguard sysusers conf
	insinto /usr/lib/sysusers.d
	newins "${FILESDIR}/${PN}.sysusers" "${PN}.conf"

	# Let's use the system implementation of openvpn
	dosym "/usr/sbin/openvpn" "${EROOT}/opt/${PN}/bin/openvpn_v2_4"
	# 20181219 - using the wrapper instead of using the binary directly
	# dosym "${EROOT}/opt/${PN}/bin/${PN}" "${EROOT}/usr/bin/${PN}"
}

#pkg_postrm() {
#	default
#	userdel -r ${PN}
#	groupdel ${PN}
#}
