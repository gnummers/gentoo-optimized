# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/lahwaacz/sxlock.git"
fi

inherit eutils ${SCM}

DESCRIPTION="simple X screen locker"
HOMEPAGE="https://github.com/lahwaacz/sxlock"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/lahwaacz/sxlock/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="sys-libs/pam
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
"
RDEPEND="${DEPEND}"
BDEPEND=""
