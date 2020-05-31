# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 webapp

DESCRIPTION="Backend for a Android based app called ShoppingList"
HOMEPAGE="https://github.com/GroundApps/ShoppingList_backend"
EGIT_REPO_URI="https://github.com/GroundApps/ShoppingList_backend.git"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/httpd-php"

src_install() {
	webapp_src_preinst

	rm README.md LICENSE CONTRIBUTING.md
	insinto "${MY_HTDOCSDIR}"
	doins -r "${S}"/*

	webapp_configfile "${MY_HTDOCSDIR}"/config.php
	webapp_src_install

	elog "If you use the sqlite db, make sure the file is writeable"
	elog "for your webserver."

}
