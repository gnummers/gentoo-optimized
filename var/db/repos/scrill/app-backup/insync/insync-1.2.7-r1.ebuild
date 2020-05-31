# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
MAGIC="35123"
SRC_URI="
	x86?      ( http://s.insynchq.com/builds/insync_${PV}.${MAGIC}-trusty_i386.deb )
	amd64?    ( http://s.insynchq.com/builds/insync_${PV}.${MAGIC}-trusty_amd64.deb )
	nautilus? ( http://s.insynchq.com/builds/insync-nautilus_${PV}.${MAGIC}-precise_all.deb )
	dolphin?  ( http://s.insynchq.com/builds/insync-dolphin_${PV}.${MAGIC}-precise_all.deb )
	thunar?   ( http://s.insynchq.com/builds/insync-thunar_${PV}.${MAGIC}-precise_all.deb )
	caja?     ( http://s.insynchq.com/builds/insync-caja_${PV}.${MAGIC}-precise_all.deb )"

SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}
	nautilus? ( dev-python/nautilus-python )
	dolphin? ( kde-apps/dolphin )
	thunar? ( dev-python/thunarx-python )"
IUSE="nautilus dolphin thunar caja"

src_unpack() {
	elog "If this fails with a deb2targz error, see"
	elog "https://github.com/mrpdaemon/gentoo-overlay/issues/4"
	mkdir "${S}"
	cd "${S}"

	if use amd64 ; then
		unpack insync_"${PV}.${MAGIC}"-trusty_amd64.deb
	else
		unpack insync_"${PV}.${MAGIC}"-trusty_i386.deb
	fi

	unpack ./data.tar.gz

	if use nautilus ; then
		unpack insync-nautilus_"${PV}.${MAGIC}"-precise_all.deb
	elif use dolphin ; then
		unpack insync-dolphin_"${PV}.${MAGIC}"-precise_all.deb
	elif use thunar ; then
		unpack insync-thunar_"${PV}.${MAGIC}"-precise_all.deb
	elif use caja ; then
		unpack insync-caja_"${PV}.${MAGIC}"-precise_all.deb
	fi

	unpack ./data.tar.gz
}

src_install() {
	cp -pPR "${S}"/usr "${D}"/ || die "Installation failed"

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync' to your session"
	elog "startup scripts. GNOME users can also choose to enable"
	elog "the insync extension via gnome-tweak-tool."
}
