# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Texas Instruments Home Computer Emulator"

SRC_URI="https://www.mrousseau.org/programs/ti99sim/archives/${P}.src.tar.xz
	roms? (
	https://ftp.whtech.com/System%20ROMs/MAME/pre_0.174/ti99_complete.zip
	https://ftp.whtech.com/emulators/mess/mess_modules.zip
	https://ftp.whtech.com/Cartridges/MAME/old/rpk.old/mg_gramkracker.rpk -> mg_gramkracker.zip )"

HOMEPAGE="https://www.mrousseau.org/programs/ti99sim/"

IUSE="+roms"

RDEPEND="media-libs/libsdl[sound,video]"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack "${P}.src.tar.xz"
	if use roms; then
		# See scripts/setup file in tarball archive
		unpack ti99_complete.zip
		mkdir {console,roms} || die
		cd console || die
		mv "${S}/roms/cf7a+.bin" . || die
		unpack ../ti99_4a.zip
		unpack ../ti99_4qi.zip
		unpack ../ti99_fdc.zip
		unpack ../ti99_pcode.zip
		unpack ../ti99_speech.zip
		unpack mg_gramkracker.zip
		cd ../roms || die
		unpack mess_modules.zip
		mv minimem*.bin ../console/ || die
	fi
}

src_prepare() {
	eapply "${FILESDIR}/rules_CFLAGS-15.0.patch"
	eapply_user

	# Use standard C++ library for regular expressions instead of boost library
	sed -i \
		-e 's:boost/regex.hpp:regex:' \
		-e 's/boost/std::__cxx11/' \
		-e 's/regex_constants/std::regex_constants/' \
		src/util/mkcart.cpp || die
	sed -i \
		-e 's/-lboost_regex//' \
		src/util/Makefile || die
}

src_configure() {
	export BIN_DIR=/usr/bin
	export DATA_DIR=/usr/share/ti99sim
}

src_install() {
	export SYS_BIN=${ED}/usr/bin
	export BIN_DIR=${ED}/usr/bin
	export DATA_DIR=${ED}/usr/share/ti99sim

	if use roms; then
		cd "${WORKDIR}/console" || die
		#########################################################
		# Does not work properly:
		# "${S}"/bin/convert-ctg -v "${S}/roms/cf7+.dat" || die
		#########################################################
		"${S}"/bin/convert-ctg -v "${S}/roms/gram-kracker.dat" || die
		"${S}"/bin/convert-ctg -v "${S}/roms/ti-994a.dat" || die
		"${S}"/bin/convert-ctg -v "${S}/roms/ti-994a-qi.dat" || die
		"${S}"/bin/convert-ctg -v "${S}/roms/ti-disk.dat" || die
		"${S}"/bin/convert-ctg -v "${S}/roms/ti-pcard.dat" || die
		"${S}"/bin/convert-ctg -v "${S}/roms/mini-memory.dat" || die
		insinto /usr/share/ti99sim/console/
		doins *.ctg
		doins spchrom.bin

		cd ../roms || die
		"${S}"/bin/mkcart -v . || die
		insinto /usr/share/ti99sim/cartridges/
		doins *.ctg

		cd "${S}" || die
	else
		ewarn "In order to run the emulator, you need to create a cartridge"
		ewarn "that contains the console ROM & GROMs from the TI-99/4A."
		ewarn "See http://www.mrousseau.org/programs/ti99sim/README.html."
	fi
	emake DESTDIR="${ED}" install || die "emake install failed"
}
