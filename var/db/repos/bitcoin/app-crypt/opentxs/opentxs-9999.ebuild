# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils versionator git-r3 cmake-utils

DESCRIPTION="Financial cryptography library, API, CLI"
HOMEPAGE="http://opentransactions.org"
EGIT_REPO_URI="git://github.com/Open-Transactions/opentxs.git \
			 https://github.com/Open-Transactions/opentxs.git"
EGIT_BRANCH="develop"
LICENSE="MPL-2"

SLOT="0"
KEYWORDS=""
IUSE="dht doc filesystem flat gnome kde +openssl nopassword python +rsa +secp256k1 +sqlite"

COMMONDEPEND="
	doc? ( app-doc/doxygen )
	gnome? ( gnome-base/gnome-keyring )
	kde? ( kde-frameworks/kwallet )
	dev-libs/openssl
	dev-libs/protobuf
	sys-libs/zlib
	net-libs/opentxs-proto
	>=net-libs/zeromq-4.1
	sqlite? ( dev-db/sqlite:3 )
	filesystem? ( dev-libs/boost )
	dht? ( net-libs/opendht )"
DEPEND="
	python? ( dev-lang/swig )
	${COMMONDEPEND}"
RDEPEND="${COMMONDEPEND}"

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
		$(cmake-utils_use gnome KEYRING_GNOME)
		$(cmake-utils_use kde KEYRING_KWALLET)
		$(cmake-utils_use flat KEYRING_FLATFILE)
		$(cmake-utils_use python PYTHON)
		$(cmake-utils_use rsa OT_CRYPTO_SUPPORTED_KEY_RSA)
		$(cmake-utils_use openssl OT_CRYPTO_USING_OPENSSL)
		$(cmake-utils_use secp256k1 OT_CRYPTO_USING_LIBSECP256K1)
		$(cmake-utils_use secp256k1 OT_CRYPTO_SUPPORTED_KEY_SECP256K1)
		$(cmake-utils_use dht OT_DHT)
		$(cmake-utils_use filesystem OT_STORAGE_FS)
		$(cmake-utils_use sqlite OT_STORAGE_SQLITE)
		$(cmake-utils_use nopassword NO_PASSWORD)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	dodoc README.md
}
