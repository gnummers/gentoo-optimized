# Copyright 1997-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Paper Icon Theme"
HOMEPAGE="http://snwh.org/paper"
SRC_URI="https://github.com/snwh/paper-icon-theme/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare()
{
	eautoreconf
	eapply_user
}
