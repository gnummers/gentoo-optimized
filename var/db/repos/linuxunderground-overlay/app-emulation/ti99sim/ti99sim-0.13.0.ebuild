# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Texas Instruments Home Computer Emulator"

SRC_URI="https://www.mrousseau.org/programs/ti99sim/archives/${P}.src.tar.gz
	roms? ( https://computerarchive.org/files/comp/files/Texas%20instruments%20ti-99/TIMRaD2.zip )"

HOMEPAGE="https://www.mrousseau.org/programs/ti99sim/"

IUSE="+roms"

RDEPEND="media-libs/libsdl[sound,video]"

DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/rules_CFLAGS-13.0.patch
	eapply -p0 "${FILESDIR}"/ti99-install3-12.1.patch
	eapply_user
}

src_configure() {
	export DATA_DIR=/usr/share/ti99sim
}

src_install() {
	export SYS_BIN=${ED}/usr/bin
	export BIN_DIR=${ED}/usr/bin
	export DATA_DIR=${ED}/usr/share/ti99sim

	if use roms; then
		einfo "System ROMs and cartridges come from TIMRaD2.zip,"
		einfo "'the' TI-99/4A Modules, ROMs and Disks 'Zip' file."

		mv ../ROMs/994AGROM.Bin .
		mv ../ROMs/994aROM.Bin .
		mv ../ROMs/Disk.Bin ti-disk.bin
		mv ../ROMs/SpchROM.Bin spchrom.bin
		mv ../MODULES/CarWarsG.Bin .
		mv ../MODULES/ParsecC.Bin .
		mv ../MODULES/ParsecG.Bin .
		mv ../MODULES/TI-InvaC.Bin .
		mv ../MODULES/TI-InvaG.Bin .
		mv ../MODULES/V-ChessC.Bin .
		mv ../MODULES/V-ChessG.Bin .

		"${S}"/src/util/Release/convert-ctg 994a.bin
		"${S}"/src/util/Release/convert-ctg --cru=1100 ti-disk.bin
		"${S}"/src/util/Release/convert-ctg V-ChessG.Bin
		"${S}"/src/util/Release/convert-ctg CarWarsG.Bin
		"${S}"/src/util/Release/convert-ctg TI-InvaG.Bin
		"${S}"/src/util/Release/convert-ctg ParsecG.Bin
		insinto /usr/share/ti99sim/roms/
		doins {TI-994A,ti-disk}.ctg
		doins spchrom.bin
		insinto /usr/share/ti99sim/cartridges/
		doins {CarWarsG,ParsecG,TI-InvaG,V-ChessG}.ctg
	else
		ewarn "In order to run the emulator, you need to create a cartridge"
		ewarn "that contains the console ROM & GROMs from the TI-99/4A."
		ewarn "See http://www.mrousseau.org/programs/ti99sim/README.html."
	fi
	emake DESTDIR="${ED}" install || die "emake install failed"
}
