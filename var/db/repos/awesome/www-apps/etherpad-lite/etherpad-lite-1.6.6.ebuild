# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user versionator
DESCRIPTION="A really-real time collaborative word processor for the web"
HOMEPAGE="http://etherpad.org"
SRC_URI="https://github.com/ether/etherpad-lite/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DEPEND=">=net-libs/nodejs-0.10.40"
RDEPEND="${DEPEND}"

ETHERPAD_DEST="/usr/share/${PN}"
ETHERPAD_LOG="/var/log/${PN}"
ETHERPAD_USER="etherpad"
ETHERPAD_GROUP="daemon"

pkg_setup() {
    enewgroup ${ETHERPAD_GROUP}
    enewuser ${ETHERPAD_USER} -1 -1 ${ETHERPAD_DEST} "${ETHERPAD_GROUP}"
}

src_prepare()
{
    default
	./bin/installDeps.sh || die
}

src_install()
{
	insinto "/etc/${PN}"
	doins "settings.json"
	rm "settings.json"
	dosym "/etc/${PN}/settings.json" "${ETHERPAD_DEST}/settings.json"

    mkdir -p "${D}${ETHERPAD_DEST}"
    cp -a . "${D}${ETHERPAD_DEST}"

    keepdir "${ETHERPAD_LOG}"
    fowners "${ETHERPAD_USER}:${ETHERPAD_GROUP}" "${ETHERPAD_LOG}"

    newconfd "${FILESDIR}/${PN}-$(get_version_component_range 1-2)-conf.d" "${PN}"
    newinitd "${FILESDIR}/${PN}-$(get_version_component_range 1-2)-init.d" "${PN}"
}
