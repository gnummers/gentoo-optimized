# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="A comprehensive PostgreSQL discovery and monitoring module for the Zabbix monitoring agent"
HOMEPAGE="http://cavaliercoder.com/libzbxpgsql/"
SRC_URI="http://sourceforge.net/projects/libzbxpgsl/files/sources/libzbxpgsql-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=net-analyzer/zabbix-2.2[agent]
	>=dev-db/postgresql-8.1
"
RDEPEND="${DEPEND}"

CONFDIR=/etc/zabbix/zabbix_agentd.d

src_configure() {
	econf --libdir=/usr/$(get_libdir)/modules
}

src_install() {
	emake DESTDIR="${D}" install || "install failed"

	dodir "${ROOT}${CONFDIR}"
	insinto "${ROOT}${CONFDIR}"
	doins "${FILESDIR}/libzbxpgsql.conf"
}

pkg_postinst() {
	elog
	elog "libzbxpgsql successfully installed."
	ewarn
	ewarn "You need to restart zabbix-agentd to apply changes"
	ewarn "You might also need to add a line"
	ewarn "\tInclude=/etc/zabbix/zabbix_agentd.d/"
	ewarn "to your zabbix_agentd.conf to instruct zabbix-agentd to parse additional configuration files."
	ewarn
}
