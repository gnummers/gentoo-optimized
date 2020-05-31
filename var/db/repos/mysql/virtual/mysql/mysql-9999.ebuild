# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Virtual for MySQL client or database"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/19"
KEYWORDS=""
IUSE="embedded static"

DEPEND=""
RDEPEND="|| (
	=dev-db/mariadb-${PV}[embedded?,server,static?]
)"
