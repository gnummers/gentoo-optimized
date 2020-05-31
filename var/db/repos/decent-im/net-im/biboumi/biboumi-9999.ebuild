# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Biboumi is an XMPP gateway that connects to IRC servers"
HOMEPAGE="https://lab.louiz.org/louiz/biboumi"
EGIT_REPO_URI="https://lab.louiz.org/louiz/biboumi.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS=""
IUSE="postgres sqlite"

DEPEND="
dev-libs/expat
net-dns/c-ares
net-dns/libidn:=
net-im/jabber-base
dev-libs/botan:=
net-libs/udns
virtual/libiconv
postgres? ( dev-db/postgresql:= )
sqlite? ( dev-db/sqlite )
"
RDEPEND="${DEPEND}"

inherit git-r3 cmake-utils

DIRS="/var/log/biboumi /var/lib/biboumi"

src_configure() {
	local mycmakeargs=(
		-DWITH_POSTGRESQL="$(usex postgres)"
		-DWITHOUT_POSTGRESQL="$(usex !postgres)"
		-DWITH_SQLITE3="$(usex sqlite)"
		-DWITHOUT_SQLITE3="$(usex !sqlite)"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/${PN}".initd "${PN}"
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}".logrotate "${PN}"
	for dir in $DIRS
	do
		keepdir $dir
	done
}

pkg_postinst() {
	for dir in $DIRS
	do
		chown jabber:jabber $dir
		chmod u=rwx,g=rx,o= $dir
	done
}
