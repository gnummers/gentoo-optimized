# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils versionator git-r3 cmake-utils

DESCRIPTION="Sequencing server for Open-Transactions"
HOMEPAGE="http://opentransactions.org"
EGIT_REPO_URI="https://github.com/Open-Transactions/opentxs-notary.git"
EGIT_BRANCH="develop"
LICENSE="AGPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE="doc flat"

DEPEND="
	doc? ( app-doc/doxygen )
	app-crypt/opentxs"
RDEPEND="
	app-crypt/opentxs
	>=net-libs/zeromq-4.1"

src_prepare() {
	local required_version="4.7"
	einfo "checking current gcc profile"
	if ! version_is_at_least ${required_version} $(gcc-version) ; then
		eerror "${P} requires gcc-${required_version} or greater to build."
		eerror "Have you gcc-config'ed to the latest version?"
		die "current gcc profile is less than ${required_version}"
	fi

	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build doc DOCUMENTATION)
		$(cmake-utils_use flat KEYRING_FLATFILE)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	dodoc README.md
}
