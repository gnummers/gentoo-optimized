# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Decode OOK modulated signals"
HOMEPAGE="https://github.com/merbanan/rtl_433"
if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/merbanan/rtl_433"
	KEYWORDS=""
else
	SRC_URI="https://github.com/merbanan/rtl_433/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="net-wireless/rtl-sdr:="
RDEPEND="${DEPEND}"
