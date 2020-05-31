# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit webos-github webos-cmake

DESCRIPTION="The Open WebOS logging daemon implementation"
HOMEPAGE="https://github.com/openwebos/pmlogdaemon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
DEPEND="dev-libs/pmloglib:public
		dev-libs/pmloglib:private
		dev-libs/librdx-stub
		sys-process/luna-service2
		>=sys-libs/zlib-1.2.3"

src_install() {
	cmake-utils_src_install
	rm -rf "${D}/etc/PmLogDaemon" || die "Can't remove /etc/PmLogDaemon dir, please, recheck ebuild"
	rm -rf "${D}/etc/event.d"     || die "Can't remove /etc/event.d dir, please, recheck ebuild"
	rm -rf "${D}/etc/init"        || die "Can't remove /etc/init dir, please, recheck ebuild"
	rm -rf "${D}/usr/share/PmLogDaemon" || die "Can't remove /usr/share/PmLogDaemon dir"
}
