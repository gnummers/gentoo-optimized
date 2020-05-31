# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils git-r3

DESCRIPTION="An open-source lint program for C++ developed by, and used at Facebook"
HOMEPAGE="https://github.com/facebookarchive/flint"
EGIT_REPO_URI="https://github.com/facebookarchive/${PN}.git"
EGIT_COMMIT="275b1253743aae7e5318575fd931d5e3313b8d0f"

KEYWORDS="~amd64"

DLANG_VERSION_RANGE="2.066-2.067"
DLANG_PACKAGE_TYPE="single"

inherit dlang

LICENSE="Boost-1.0"
SLOT="0"
IUSE=""

DEPEND="dev-cpp/folly"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/flint-9999-Fix-build-after-C-removal.patch"

	eapply_user

	eautoreconf
}
