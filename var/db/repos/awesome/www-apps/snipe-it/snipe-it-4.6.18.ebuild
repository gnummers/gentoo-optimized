# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/ampache/ampache-3.5.4.ebuild,v 1.2 2012/06/22 21:24:02 mabi Exp $

EAPI="5"

inherit webapp git-r3

DESCRIPTION="A free open source IT asset/license management system built in PHP on Laravel and Bootstrap."
HOMEPAGE="http://snipeitapp.com"

EGIT_REPO_URI="https://github.com/snipe/snipe-it.git"
[[ ${PV} == "9999" ]] || EGIT_COMMIT=v${PV}

LICENSE="AGPL-3"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="+ldap"

RDEPEND=">=dev-lang/php-7.1.3[crypt,fileinfo,pdo,mysql,unicode,curl,gd,ldap?]
		dev-php/pecl-imagick
		virtual/httpd-php"
DEPEND="dev-php/composer"

pkg_pretend() {
	# Check for Github API token
	if [[ -n "$GITHUB_API_TOKEN" ]] ; then
		einfo "Using Github API token \"$GITHUB_API_TOKEN\" from environment variable GITHUB_API_TOKEN ..."
	else
		eerror "Please specify a Github API key in GITHUB_API_TOKEN environment"
		eerror "variable to avoid exhausting the Github API limit when installing"
		eerror "vendor files using PHP's composer."
		eerror "You can manage your Github API tokens here: "
		eerror "https://github.com/settings/tokens"
		die "Please specify a Github API key in GITHUB_API_TOKEN environment variable!"
	fi
}

src_prepare() {
	# Composer might create this
	addpredict /var/lib/net-snmp/mib_indexes

	# Add Github API token to composer file
	composer config -g github-oauth.github.com "$GITHUB_API_TOKEN"

	einfo "Running composer  ..."
	composer install --no-dev --prefer-source
	composer dump-autoload
}

src_install() {
	webapp_src_preinst

	dodoc "$FILESDIR/nginx.conf"

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_postinst_txt en "${FILESDIR}"/installdoc.txt
	webapp_serverowned -R "${MY_HTDOCSDIR}/"{"storage","public/uploads"}

	newins .env.example .env
	webapp_configfile "${MY_HTDOCSDIR}/.env"

	webapp_src_install
	fperms -R 0660 "${MY_HTDOCSDIR}/"{"storage","public/uploads"}
}
