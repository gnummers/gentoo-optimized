# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Libpurple protocol plugin for matrix"
HOMEPAGE="https://github.com/matrix-org/purple-matrix"
if [[ "${PV}" ==  9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/matrix-org/purple-matrix.git"
else
	SRC_URI="https://github.com/matrix-org/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="olm"

RDEPEND="
	dev-db/sqlite:3
	dev-libs/glib
	dev-libs/json-glib
	net-im/pidgin
	net-libs/http-parser:=
	olm? (
		dev-libs/libgcrypt:0=
		dev-libs/olm:=
	)"
DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	default
	sed '/^CFLAGS.*-O0/d' -i Makefile.common || die
}

src_compile() {
	use olm || export MATRIX_NO_E2E=1
	emake CC="$(tc-getCC)" PKG_CONFIG="$(tc-getBUILD_PKG_CONFIG)"
}
