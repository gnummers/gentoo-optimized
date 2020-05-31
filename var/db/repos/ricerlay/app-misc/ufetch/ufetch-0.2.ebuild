# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/jschx/ufetch.git"
fi

DESCRIPTION="Tiny system info for Unix-like operating systems"
HOMEPAGE="https://gitlab.com/jschx/ufetch"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://gitlab.com/jschx/ufetch/-/archive/v${PV}/ufetch-v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/${PN}-v${PV}"
fi

src_install() {
	exeinto /usr/bin
	newexe ufetch-gentoo ufetch
}
