# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit user eutils fdo-mime python-single-r1 gnome2-utils git-r3

DESCRIPTION="Bitmessage is a P2P communications protocol used to send encrypted messages to another person or to many subscribers."
HOMEPAGE="https://bitmessage.org"

EGIT_REPO_URI="git://github.com/Bitmessage/PyBitmessage.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc X"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
        dev-libs/openssl[-bindist]
        dev-python/PyQt4[${PYTHON_USEDEP}]"

pkg_setup() {
        enewgroup bitmessage
        enewuser bitmessage -1 -1 -1 bitmessage
	esethome bitmessage /var/lib/bitmessage
}

src_compile() { :; }

src_install() {
	#python modules
	
	cd ${S}/src
	python_setup
	python_moduleinto ${PN}
	python_domodule *.py bitmessageqt images pyelliptic socks translations

	#init.d script
	doinitd ${FILESDIR}/bitmessage

	#icons and menu entries
	newicon -s 24 ${S}/desktop/icon24.png ${PN}.png	
	newicon -s scalable ${S}/desktop/can-icon.svg ${PN}.svg
	domenu ${S}/desktop/${PN}.desktop
	validate_desktop_entries

	# Install README and (Debian) changelog
	if use doc ; then
		dodoc ${S}/README.md ${S}/debian/changelog
	fi
        doman ${S}/man/*

	keepdir /var/log/bitmessage

	echo "#!/bin/bash" > "${T}/pybitmessage"
	echo "exec python2 $(python_get_sitedir)/pybitmessage/bitmessagemain.py" >> "${T}/pybitmessage"
	dobin "${T}/pybitmessage"

	#Bitmessage can't boostrap in daemon mode. These files will allow BM to start up successfully.

	insinto /var/lib/bitmessage/.config/PyBitmessage
	newins ${FILESDIR}/keys.dat keys.dat.bootstrap
	newins ${FILESDIR}/messages.dat messages.dat.bootstrap
	fowners bitmessage:bitmessage /var/lib/bitmessage/.config /var/lib/bitmessage/.config/PyBitmessage
	fowners bitmessage:bitmessage /var/lib/bitmessage/.config/PyBitmessage/keys.dat.bootstrap /var/lib/bitmessage/.config/PyBitmessage/messages.dat.bootstrap
	fowners bitmessage:bitmessage /var/log/bitmessage
	fperms 0770 /var/lib/bitmessage/.config /var/lib/bitmessage/.config/PyBitmessage /var/log/bitmessage
	fperms 0660 /var/lib/bitmessage/.config/PyBitmessage/keys.dat.bootstrap /var/lib/bitmessage/.config/PyBitmessage/messages.dat.bootstrap
}

pkg_preinst() {
        gnome2_icon_savelist
}

pkg_postinst() {
        gnome2_icon_cache_update

	# Copy bootstrap configs into place IFF no existing configs exist.
	# This allows PyBitmessage-Daemon to be run to set up API access before
	# starting the daemon for the first time.

	KEYS_DAT="/var/lib/bitmessage/.config/PyBitmessage/keys.dat"
	MESSAGES_DAT="/var/lib/bitmessage/.config/PyBitmessage/messages.dat"

        if [[ ! -e "${KEYS_DAT}" ]] ; then
                cp -a "${KEYS_DAT}.bootstrap" "${KEYS_DAT}"
        fi
  
        if [[ ! -e "${MESSAGES_DAT}" ]] ; then
                cp -a "${MESSAGES_DAT}.bootstrap" "${MESSAGES_DAT}"
        fi
}

pkg_postrm() {
        gnome2_icon_cache_update
	fdo-mime_desktop_database_update
}

