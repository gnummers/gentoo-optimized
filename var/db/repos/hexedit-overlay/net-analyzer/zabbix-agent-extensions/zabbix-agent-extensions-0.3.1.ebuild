# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Zabbix Agent extensions"
HOMEPAGE="https://www.ifproject.ru/project/zabbix-agent-extensions.html"
SRC_URI="https://redmine.ifproject.ru/attachments/download/18/zabbix-agent-extensions-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="asterisk apcupsd openrc"

DEPEND="
	net-analyzer/zabbix[agent]
	asterisk? (
		net-misc/asterisk
		dev-lang/perl
		virtual/perl-Getopt-Long
		virtual/perl-JSON-PP
	)
	apcupsd? (
		sys-power/apcupsd
		dev-lang/perl
	)
	openrc? ( sys-apps/openrc )
"
RDEPEND="${DEPEND}"

CONFDIR=/etc/zabbix/zabbix_agentd.d
EXECDIR=/usr/libexec/zabbix-agent-extensions

doconf()
{
	use $1 && newins $1/userparameters.conf $1.conf
}

src_install()
{
	dodir ${ROOT}${EXECDIR}
	exeinto ${ROOT}${EXECDIR}
	use asterisk && doexe asterisk/asterisk.pl
	use apcupsd && doexe apcupsd/apcupsd.pl
	use openrc && doexe openrc/openrc.sh

	dodir ${ROOT}${CONFDIR}
	insinto ${ROOT}${CONFDIR}
	doconf asterisk
	doconf apcupsd
	doconf openrc
}

pkg_postinst() {
	elog
	elog "${P} successfully installed."
	ewarn
	ewarn "You need to restart zabbix-agentd to apply changes"
	ewarn "You might also need to add a line"
	ewarn "\tInclude=${CONFDIR}/"
	ewarn "to your zabbix_agentd.conf to instruct zabbix-agentd to parse additional configuration files."
	ewarn
}
