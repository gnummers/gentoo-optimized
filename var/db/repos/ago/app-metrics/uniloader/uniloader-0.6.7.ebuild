# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# DISCLAIMER:
# This ebuild does NOT follow the Gentoo QA Rules, instead it follows the upstream way to install and run the application

EAPI=7

DESCRIPTION="A go-based program that uploads data to a local or remote QueueMetrics"
HOMEPAGE="https://www.queuemetrics-live.com/uniloader.jsp"
LICENSE="all-rights-reserved"
SRC_URI="https://downloads.loway.ch/qm/${P}.tar.gz"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="acct-group/queuemetrics
	acct-user/queuemetrics"

src_install() {
	dodir /opt/${PN}/bin
	exeinto /opt/${PN}/bin
	newexe bin/${PN}_amd64 ${PN}

	keepdir /var/log/${PN}
	fowners queuemetrics:queuemetrics /var/log/${PN}
	fperms 0750 /var/log/${PN}

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
}
