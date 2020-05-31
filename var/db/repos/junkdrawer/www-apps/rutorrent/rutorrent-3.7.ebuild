# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit webapp eutils

DESCRIPTION="ruTorrent is a front-end for the popular Bittorrent client rTorrent"
HOMEPAGE="https://github.com/Novik/ruTorrent"
SRC_URI="https://bintray.com/artifact/download/novik65/generic/ruTorrent-${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~x86"
IUSE=""

need_httpd_cgi

DEPEND="
	|| ( dev-lang/php[xml,gd] dev-lang/php[xml,gd-external] )
"
RDEPEND="virtual/httpd-php"

S="${WORKDIR}/ruTorrent-master"

pkg_setup() {
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	chmod +x "${ED}${MY_HTDOCSDIR}"/plugins/*/*.sh \
		"$ED${MY_HTDOCSDIR}"/php/test.sh || die "chmod failed"

	webapp_serverowned "${MY_HTDOCSDIR}"/share
	webapp_serverowned "${MY_HTDOCSDIR}"/share/settings
	webapp_serverowned "${MY_HTDOCSDIR}"/share/torrents
	webapp_serverowned "${MY_HTDOCSDIR}"/share/users

	webapp_configfile "${MY_HTDOCSDIR}"/conf/.htaccess
	webapp_configfile "${MY_HTDOCSDIR}"/conf/config.php
	webapp_configfile "${MY_HTDOCSDIR}"/conf/access.ini
	webapp_configfile "${MY_HTDOCSDIR}"/conf/plugins.ini
	webapp_configfile "${MY_HTDOCSDIR}"/share/.htaccess

	webapp_src_install
}
