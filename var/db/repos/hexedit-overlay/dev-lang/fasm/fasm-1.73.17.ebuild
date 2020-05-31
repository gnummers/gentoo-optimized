# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Flat Assembler"
HOMEPAGE="http://flatassembler.net/"
SRC_URI="http://flatassembler.net/fasm-${PV}.tgz"

S="${WORKDIR}/fasm"

LICENSE="fasm"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	amd64? ( app-emulation/emul-linux-x86-baselibs )
"

src_install() {
	insinto opt/fasm
	doins -r *
	exeinto opt/fasm
	doexe fasm
	dobin fasm
}
