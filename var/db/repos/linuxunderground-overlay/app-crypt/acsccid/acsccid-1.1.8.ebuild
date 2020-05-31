# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools multilib udev

SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Generic driver for ACS (CCID and non-CCID) Smart Card Reader."

HOMEPAGE="https://github.com/acshk/acsccid"
SRC_URI="https://codeload.github.com/acshk/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"

RDEPEND=">=sys-apps/pcsc-lite-1.8.3
	virtual/libusb:1
	!app-crypt/ccid
	!app-crypt/acr38u"
DEPEND="${RDEPEND}
	kernel_linux? ( virtual/pkgconfig )
	dev-lang/perl
	sys-devel/flex"

IUSE=""

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default

	if use kernel_linux; then
		udev_newrules "${FILESDIR}"/92-pcsc-acsccid.rules 92-pcsc-acsccid.rules
	fi
}
