# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/wmutils/core"
fi

inherit eutils ${SCM}

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/wmutils/core/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/core-${PV}"
fi

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
