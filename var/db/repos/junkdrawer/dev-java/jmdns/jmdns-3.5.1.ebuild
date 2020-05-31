# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
JAVA_PKG_IUSE="doc examples source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JmDNS is an implementation of multi-cast DNS in Java"
SRC_URI="https://github.com/jmdns/${PN}/archive/${P}.tar.gz"
HOMEPAGE="https://github.com/jmdns/jmdns"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

CDEPEND="dev-java/slf4j-api:0"
DEPEND=">=virtual/jdk-1.6
	${CDEPEND}"
RDEPEND=">=virtual/jre-1.6
	${CDEPEND}"

JAVA_SRC_DIR="src/main"

S="${WORKDIR}/${PN}-${P}"

JAVA_GENTOO_CLASSPATH="slf4j-api"

src_prepare() {
	rm "${S}"/build.xml || die
	find -name "*.jar" -delete || die
	find "${JAVA_SRC_DIR}" -name "*Test.java" -delete || die
}

src_install() {
	java-pkg-simple_src_install

	use examples && java-pkg_doexamples src/sample
}
