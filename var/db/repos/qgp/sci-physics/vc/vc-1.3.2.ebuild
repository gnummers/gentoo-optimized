# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/VcDevel/Vc.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/VcDevel/Vc/releases/download/${PV}/Vc-${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/Vc-${PV}"
fi

DESCRIPTION="Vc"
HOMEPAGE="https://github.com/VcDevel/Vc"

SLOT="0"
