# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

VCS_INHERIT=""
MY_PN="client-java"

if [[ "${PV}" == 9999 ]] ; then
	VCS_INHERIT="git-r3"
	EGIT_REPO_URI="https://github.com/MariaDB/mariadb-connector-j.git"
else
SRC_URI="
	http://ftp.osuosl.org/pub/mariadb/${MY_PN}-${PV}/${P}.tar.gz
	http://mirrors.fe.up.pt/pub/mariadb/${MY_PN}-${PV}/${P}.tar.gz
	http://ftp-stud.hs-esslingen.de/pub/Mirrors/mariadb/${MY_PN}-${PV}/${P}.tar.gz
	"
fi

JAVA_PKG_IUSE="doc"

inherit java-pkg-2 java-ant-2 eutils ${VCS_INHERIT}

DESCRIPTION="Java client library for MariaDB/MySQL"
HOMEPAGE="http://mariadb.org/"
LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS=""
IUSE="${IUSE}"

# Tests require a server running on localhost port 3306
RESTRICT="test"

RDEPEND="${RDEPEND} >=virtual/jre-1.6"
DEPEND="${DEPEND} >=virtual/jdk-1.6"

src_prepare() {
	cp "${FILESDIR}/maven-build-1.1.4.xml" build.xml
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg_dojar target/${PN}.jar
}