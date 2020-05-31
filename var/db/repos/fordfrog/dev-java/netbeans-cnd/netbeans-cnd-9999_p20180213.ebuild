# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Netbeans CND Cluster"
HOMEPAGE="https://netbeans.org/projects/cnd"
SLOT="9999"
SOURCE_URL="http://bits.netbeans.org/download/trunk/nightly/2018-02-13_00-02-34/zip/netbeans-trunk-nightly-201802130002-src.zip"
SRC_URI="${SOURCE_URL}
	https://dev.gentoo.org/~fordfrog/distfiles/netbeans-9999-r21-build.xml.patch.bz2
	https://hg.netbeans.org/binaries/5CAB59D859CAA6598E28131D30DD2E89806DB57F-antlr-3.4.jar
	https://hg.netbeans.org/binaries/4E74C6BE42FE89871A878C7C4D6158F21A6D8010-antlr-runtime-3.4.jar
	https://hg.netbeans.org/binaries/BBEBAEE8729CCF165E2080A915542C6875208F97-clank_0.3.9.zip
	https://hg.netbeans.org/binaries/B7B417DE191ACF30A60E061437B810840128A89D-cnd-build-trace-1.0.zip
	https://hg.netbeans.org/binaries/E59851B0E49C05D728D5C653E52750FA5B6A8F0E-cnd-rfs-1.0.zip
	https://hg.netbeans.org/binaries/C51780D99464CBF45B0495C7646B442AB3C7B463-open-fortran-parser-0.7.1.2.zip
	https://hg.netbeans.org/binaries/6356FC5709DA48844F0E64E241657F1B26AE6EF1-t-common-1.0.zip"
LICENSE="|| ( CDDL GPL-2-with-linking-exception )"
KEYWORDS="~amd64 ~x86"
IUSE=""
S="${WORKDIR}"

# These files are for remote development and debugging
QA_PREBUILT="usr/share/netbeans-cnd-${SLOT}/bin/*"

CDEPEND="virtual/jdk:1.8
	~dev-java/netbeans-dlight-${PV}
	~dev-java/netbeans-harness-${PV}
	~dev-java/netbeans-ide-${PV}
	~dev-java/netbeans-platform-${PV}"
DEPEND="${CDEPEND}
	app-arch/unzip
	dev-java/jna:4
	dev-java/javahelp:0"
RDEPEND="${CDEPEND}"

INSTALL_DIR="/usr/share/${PN}-${SLOT}"

EANT_BUILD_XML="nbbuild/build.xml"
EANT_BUILD_TARGET="rebuild-cluster"
EANT_EXTRA_ARGS="-Drebuild.cluster.name=nb.cluster.cnd -Dext.binaries.downloaded=true -Dpermit.jdk8.builds=true"
EANT_FILTER_COMPILER="ecj-3.3 ecj-3.4 ecj-3.5 ecj-3.6 ecj-3.7"
JAVA_PKG_BSFIX="off"

src_unpack() {
	unpack $(basename ${SOURCE_URL})

	einfo "Deleting bundled jars..."
	find -name "*.jar" -type f -delete

	unpack netbeans-9999-r21-build.xml.patch.bz2

	pushd "${S}" >/dev/null || die
	ln -s "${DISTDIR}"/5CAB59D859CAA6598E28131D30DD2E89806DB57F-antlr-3.4.jar libs.antlr3.devel/external/antlr-3.4.jar || die
	ln -s "${DISTDIR}"/4E74C6BE42FE89871A878C7C4D6158F21A6D8010-antlr-runtime-3.4.jar libs.antlr3.runtime/external/antlr-runtime-3.4.jar || die
	ln -s "${DISTDIR}"/BBEBAEE8729CCF165E2080A915542C6875208F97-clank_0.3.9.zip libs.clank/external/clank_0.3.9.zip || die
	ln -s "${DISTDIR}"/B7B417DE191ACF30A60E061437B810840128A89D-cnd-build-trace-1.0.zip cnd.discovery/external/cnd-build-trace-1.0.zip || die
	ln -s "${DISTDIR}"/E59851B0E49C05D728D5C653E52750FA5B6A8F0E-cnd-rfs-1.0.zip cnd.remote/external/cnd-rfs-1.0.zip || die
	ln -s "${DISTDIR}"/C51780D99464CBF45B0495C7646B442AB3C7B463-open-fortran-parser-0.7.1.2.zip cnd.modelimpl/external/open-fortran-parser-0.7.1.2.zip || die
	ln -s "${DISTDIR}"/6356FC5709DA48844F0E64E241657F1B26AE6EF1-t-common-1.0.zip libs.dbx.support/external/t-common-1.0.zip || die
	popd >/dev/null || die
}

src_prepare() {
	einfo "Deleting bundled class files..."
	find -name "*.class" -type f | xargs rm -vf

	epatch netbeans-9999-r21-build.xml.patch

	einfo "Symlinking external libraries..."
	java-pkg_jar-from --build-only --into javahelp/external javahelp jhall.jar jhall-2.0_05.jar
	java-pkg_jar-from --build-only --into libs.jna/external jna-4 jna.jar jna-4.4.0.jar

	einfo "Linking in other clusters..."
	mkdir "${S}"/nbbuild/netbeans || die
	pushd "${S}"/nbbuild/netbeans >/dev/null || die

	ln -s /usr/share/netbeans-dlight-${SLOT} dlight || die
	cat /usr/share/netbeans-dlight-${SLOT}/moduleCluster.properties >> moduleCluster.properties || die
	touch nb.cluster.dlight.built

	ln -s /usr/share/netbeans-harness-${SLOT} harness || die
	cat /usr/share/netbeans-harness-${SLOT}/moduleCluster.properties >> moduleCluster.properties || die
	touch nb.cluster.harness.built

	ln -s /usr/share/netbeans-ide-${SLOT} ide || die
	cat /usr/share/netbeans-ide-${SLOT}/moduleCluster.properties >> moduleCluster.properties || die
	touch nb.cluster.ide.built

	ln -s /usr/share/netbeans-platform-${SLOT} platform || die
	cat /usr/share/netbeans-platform-${SLOT}/moduleCluster.properties >> moduleCluster.properties || die
	touch nb.cluster.platform.built

	popd >/dev/null || die

	java-pkg-2_src_prepare
	default
}

src_install() {
	pushd nbbuild/netbeans/cnd >/dev/null || die

	insinto ${INSTALL_DIR}

	grep -E "/cnd$" ../moduleCluster.properties > "${D}"/${INSTALL_DIR}/moduleCluster.properties || die

	doins -r *
	fperms 755 bin/dorun.sh

	popd >/dev/null || die

	dosym ${INSTALL_DIR} /usr/share/netbeans-nb-${SLOT}/cnd
}
