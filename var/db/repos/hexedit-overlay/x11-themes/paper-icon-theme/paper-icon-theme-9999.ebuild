# Copyright 1997-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Paper Icon Theme"
HOMEPAGE="http://snwh.org/paper"
EGIT_REPO_URI="https://github.com/snwh/paper-icon-theme.git"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare()
{
	eautoreconf
	eapply_user
}
