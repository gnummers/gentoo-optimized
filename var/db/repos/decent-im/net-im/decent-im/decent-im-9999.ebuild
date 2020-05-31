# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils git-r3 user

DESCRIPTION="Prepared, cutting edge XMPP server configuration"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://decent.im"

# Point to any required sources; these will be automatically downloaded by
# Portage.
EGIT_REPO_URI="https://github.com/decent-im/decent.im"

LICENSE="GPL-3+"

SLOT="0"

KEYWORDS="x86 amd64"

IUSE=""

DEPEND=""
# TODO Add TURN server to RDEPEND
# coturn was used with Ubuntu, but absent in Portage Tree and overlays
RDEPEND="=net-im/prosody-9999
=net-im/prosody-modules-9999
net-im/spectrum2
=net-im/biboumi-9999
net-im/pidgin
x11-plugins/purple-facebook
www-servers/nginx
app-crypt/certbot
dev-db/postgresql
net-dns/bind-tools
app-portage/smart-live-rebuild
sys-apps/kexec-tools
net-misc/ntp
"

src_install() {
	emake DESTDIR="${D}/usr" install
}

pkg_postinst() {
	if ! [[ -e "$ROOT/etc/decent.im/config" ]] ; then
		elog
		elog "To finish configuration of new setup, execute:"
		elog "    emerge --config =${CATEGORY}/${PF}"
	fi
}

pkg_config() {
	einfo "Updating rc to start ntpd, postgresql-9.5, prosody, spectrum on default runlevel ..."
	rc-update add postgresql-9.5 default
	rc-update add prosody default
	rc-update add spectrum2 default
	rc-update add biboumi default
	rc-update add ntpd default

	einfo "Starting ntpd ..."
	rc-service ntpd start

	einfo "Generating decent.im config ..."
	decent.im_configure

	einfo "Processing software config templates ..."
	decent.im_process_templates

	einfo "Generating and populating TLS certs ..."
	decent.im_letsencrypt

	einfo "Creating databases and access credentials for Prosody and Spectrum ..."
	decent.im_create_db_pg

	einfo "Starting Prosody and Spectrum ..."
	rc-service prosody start
	rc-service spectrum2 start
	rc-service biboumi start
}

pkg_preinst() {
	if ! [[ -e "$ROOT/etc/decent.im/config" ]]
	then
		einfo "Generating decent.im config ..."
		"$D"/usr/sbin/decent.im_configure "$D"/etc/decent.im/config
	fi

	einfo "Processing software config templates ..."
	"$D"/usr/sbin/decent.im_process_templates "$ROOT" "$D"
}
