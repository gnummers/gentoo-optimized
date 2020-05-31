# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils versionator git-r3 cmake-utils

DESCRIPTION="Protobuf message library for Open-Transactions"
HOMEPAGE="http://opentransactions.org"
EGIT_REPO_URI="git://github.com/Open-Transactions/opentxs-proto.git \
			 https://github.com/Open-Transactions/opentxs-proto.git"
EGIT_BRANCH="pre-1.0"
LICENSE="MPL-2"

SLOT="0"
KEYWORDS=""
IUSE="java javascript python"

DEPEND=">=dev-libs/protobuf-2.7
	java? ( dev-java/protobuf-java )
	python? ( dev-python/protobuf-python )"
RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
                $(cmake-utils_use java JAVA)
                $(cmake-utils_use javascript JAVASCRIPT)
                $(cmake-utils_use python PYTHON)
        )
        cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	dodoc README.md
}
