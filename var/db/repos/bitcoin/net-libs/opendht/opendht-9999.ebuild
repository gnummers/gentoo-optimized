# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils versionator git-r3 cmake-utils

DESCRIPTION="A lightweight C++11 Distributed Hash Table implementation"
HOMEPAGE="https://github.com/savoirfairelinux/opendht/blob/master/README.md"
EGIT_REPO_URI="git://github.com/savoirfairelinux/opendht.git \
			 https://github.com/savoirfairelinux/opendht.git"
EGIT_BRANCH="master"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS=""

DEPEND=">=dev-libs/msgpack-1.2
	>=dev-libs/nettle-3
	net-libs/gnutls"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install

	dodoc README.md
}
