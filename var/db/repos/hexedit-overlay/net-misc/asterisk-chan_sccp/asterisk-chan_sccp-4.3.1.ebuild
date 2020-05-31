# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="chan-sccp-${PV}"

DESCRIPTION="SCCP channel plugin for the Asterisk soft PBX"
HOMEPAGE="http://chan-sccp-b.sourceforge.net"
SRC_URI="https://github.com/chan-sccp/chan-sccp/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ppc x86 amd64"
IUSE="+pickup +park +dirtrfr +monitor conference +manager +functions indications +realtime video advanced-config advanced-functions dynamic-config dynamic-speeddial debug static"

DEPEND="
	>=net-misc/asterisk-1.6.2
	>=sys-devel/autoconf-2.6.0
	>=sys-devel/automake-1.10
	>=sys-devel/libtool-2.2.2
	>=sys-devel/m4-1.4.5
"

src_configure() {
	econf\
		$(use_enable debug)\
		$(use_enable static)\
		$(use_with pickup)\
		$(use_with park)\
		$(use_with dirtrfr)\
		$(use_with monitor)\
		$(use_with conference)\
		$(use_with manager)\
		$(use_with functions)\
		$(use_with indications)\
		$(use_with realtime)\
		$(use_with video)\
		$(use_with advanced-config)\
		$(use_with advanced-functions)\
		$(use_with dynamic-speeddial)\
	|| die "configure failed."
}

src_compile() {
	emake || die "make failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed."

	# install configs
	einfo "Installing default config files..."
	mkdir -p ${D}etc/asterisk
	find ${S}/conf/ -name '.svn' -print0 | xargs -0 rm -rf # cleaning svn files
	cp -rf ${S}/conf/* ${D}etc/asterisk

	# fix permissions
	if [[ -n "$(egetent group asterisk)" ]]; then
		einfo "Fixing permissions..."
		chown -R asterisk:asterisk ${D}etc/asterisk
		chmod -R u=rwX,g=rX,o= ${D}etc/asterisk
	fi
}

pkg_postinst() {
	ewarn "You have to disable asterisk's chan_skinny to use this module!"
	elog "Add \"noload => chan_skinny.so\" to ${ROOT}etc/asterisk/modules.conf"
}
