# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# DISCLAIMER:
# This ebuild does NOT follow the Gentoo QA Rules, instead it follows the upstream way to install and run the application

EAPI=7

inherit systemd

TOMCAT_VERSION="8.5.54"

DESCRIPTION="A monitoring and reporting suite for asterisk based PBX"
HOMEPAGE="https://www.queuemetrics.com"
LICENSE="all-rights-reserved"
SRC_URI="https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
	https://downloads.loway.ch/qm/QueueMetrics-${PV}.tar.gz"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mysql uniloader"


RDEPEND="acct-group/queuemetrics
	acct-user/queuemetrics
	virtual/jdk:1.8"
PDEPEND="mysql? ( virtual/mysql[server] )
	uniloader? ( app-metrics/uniloader )"

S="${WORKDIR}"

pkg_setup() {
	if [ "$( cat /opt/queuemetrics/tomcat/VERSION )" != "${TOMCAT_VERSION}" ]
	then
		ewarn
		ewarn
		ewarn "This ebuild will install a newer version of apache tomcat."
		ewarn "You need to restart udev as soon as possible to make the upgrade go into effect."
		ewarn "For sys-apps/openrc users it is:"
		ewarn "# /etc/init.d/queuemetrics restart"
		ewarn
		ewarn "For sys-apps/systemd users it is:"
		ewarn "# systemctl restart queuemetrics"
		ewarn
		ewarn
	fi
}

src_install() {
	dodir /opt/${PN}/tomcat/{logs,temp,webapps,work}
	insinto /opt/${PN}/tomcat
	doins -r apache-tomcat-${TOMCAT_VERSION}/{bin,conf,lib}

	cp "${FILESDIR}/server.xml" "${D}"/opt/${PN}/tomcat/conf/

	fowners -R ${PN}:${PN} /opt/${PN}
	fperms 0750 /opt/${PN}

	cp -r ${P} "${D}"/opt/${PN}/tomcat/webapps/${PN}

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	systemd_dounit "${FILESDIR}/${PN}.service"
	systemd_dounit "${FILESDIR}/${PN}.socket"
	systemd_install_serviced "${FILESDIR}/${PN}.service.conf"

	doenvd "${FILESDIR}/25${PN}"

	echo "${TOMCAT_VERSION}" > "${D}"/opt/${PN}/tomcat/VERSION
}
