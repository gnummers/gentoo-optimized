# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="emerge-delta-webrsync rewrite to take advantage of lbzip2 (using deltas)"
SLOT=0
KEYWORDS="~amd64 ~x86"

RDEPEND="app-arch/tarsync
	!app-portage/emerge-delta-webrsync
	net-ftp/lftp"

MY_PN=${PN/-ng}

src_install() {
	dosbin $FILESDIR/$MY_PN || die
}

pkg_postinst() {
	chgrp -v portage /usr/sbin/$MY_PN
	chmod -v 2750 /usr/sbin/$MY_PN
}
