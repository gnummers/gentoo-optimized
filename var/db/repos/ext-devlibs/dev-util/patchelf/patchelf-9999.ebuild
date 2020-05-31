# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 autotools

DESCRIPTION="Small utility to modify the dynamic linker and RPATH of ELF executables."
HOMEPAGE="http://nixos.org/patchelf.html"

SLOT="0"
KEYWORDS=""
LICENSE="GPL-3"
IUSE="test"

EGIT_REPO_URI="https://github.com/NixOS/patchelf.git"

src_prepare() {
	rm src/elf.h || die
	eapply_user
	eautoreconf
}
