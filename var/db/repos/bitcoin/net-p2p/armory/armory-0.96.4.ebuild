# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ssl"

if [[ ${PV} == 9999 ]]; then
	SRC_URI=""
	EGIT_REPO_URI="git://github.com/goatpig/BitcoinArmory.git"
	GIT_SCM=git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/goatpig/BitcoinArmory/releases/download/v${PV}/${PN}_${PV}_src.tar"
	S="${WORKDIR}/${PN}_${PV}_src"
	KEYWORDS="~x86 ~amd64"
fi

inherit eutils fdo-mime python-single-r1 ${GIT_SCM}
unset GIT_SCM

DESCRIPTION="Armory is a Bitcoin client, offering a dozen innovative features not found anywhere else."
HOMEPAGE="https://github.com/goatpig/BitcoinArmory"

LICENSE="AGPL-3"
SLOT="0"
IUSE=""

COMMON_DEPEND="${PYTHON_DEPS}
			   dev-libs/crypto++
			   dev-libs/leveldb
			   dev-python/PyQt4[X]"

DEPEND="${COMMON_DEPEND}
		>=dev-lang/swig-3.0.0
		x11-misc/xdg-utils"

RDEPEND="${COMMON_DEPEND}
		 dev-python/psutil"

src_prepare() {
	default

	# GCC detection does not work with portage-set vars, but a better fix should be made
	epatch "${FILESDIR}/gcc-0.96.patch"

	sed -i "s|python /usr/lib/|${EPYTHON} $(python_get_sitedir)/|" \
		dpkgfiles/*.desktop || die "failed to modify desktop entry exec parameter"

	./autogen.sh || die
}

src_install() {
	python_moduleinto ${PN}
	python_domodule armoryengine extras ui pytest *.py _CppBlockUtils.so

	dodoc README.md

	insinto "/usr/share/${PN}/img"
	doins img/*

	domenu dpkgfiles/*.desktop

	echo "${EPYTHON} $(python_get_sitedir)/armory/ArmoryQt.py "'"$@"' > "${T}/armory"
	dobin "${T}/armory"
	dobin ArmoryDB
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update

	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryofflineicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_green_64x64.png armorytestneticon
	xdg-icon-resource forceupdate
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update

	xdg-icon-resource uninstall --size 64 armoryicon
	xdg-icon-resource uninstall --size 64 armorytestneticon
	xdg-icon-resource uninstall --size 64 armoryofflineicon
	xdg-icon-resource forceupdate
}
