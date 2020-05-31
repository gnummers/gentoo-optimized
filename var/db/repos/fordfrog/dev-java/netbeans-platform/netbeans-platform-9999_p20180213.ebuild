# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Netbeans Platform"
HOMEPAGE="https://netbeans.org/features/platform/"
SLOT="9999"
SOURCE_URL="http://bits.netbeans.org/download/trunk/nightly/2018-02-13_00-02-34/zip/netbeans-trunk-nightly-201802130002-src.zip"
SRC_URI="${SOURCE_URL}
	https://dev.gentoo.org/~fordfrog/distfiles/netbeans-9999-r21-build.xml.patch.bz2
	https://hg.netbeans.org/binaries/2F7553F50B0D14ED811B849C282DA8C1FFC32AAE-asm-all-5.0.1.jar
	https://hg.netbeans.org/binaries/1BA97A9FFD4A1DFF3E75B76CD3AE3D0EFF8493B7-felix-4.2.1.jar
	https://hg.netbeans.org/binaries/941A8BE4506C65F0A9001C08812FB7DA1E505E21-junit-4.12-javadoc.jar
	https://hg.netbeans.org/binaries/03800C0C31FD6828EA7D3F245B3A7C00E221AA22-ko4j-1.4.jar
	https://hg.netbeans.org/binaries/F752490EC8F6CEC5B7E07947A1407CE8A8E63518-net.java.html-1.4.jar
	https://hg.netbeans.org/binaries/DEABE58D6CDDD124BEA30E9B6E6BD48E90CD7AA1-net.java.html.boot-1.4.jar
	https://hg.netbeans.org/binaries/A5ECB6F58BB276CF77FD0E18A07656508E7099B6-net.java.html.boot.fx-1.4.jar
	https://hg.netbeans.org/binaries/5CC4FD2D576DEEC4F64E46BAA9097525BA4DF8D8-net.java.html.boot.script-1.4.jar
	https://hg.netbeans.org/binaries/0C735D28C3C2F22A9EB86A1F682AAC38920A6356-net.java.html.geo-1.4.jar
	https://hg.netbeans.org/binaries/CD15F35E44B6EC1CF8D7CC216870B70A71D88A1B-net.java.html.json-1.4.jar
	https://hg.netbeans.org/binaries/D7902EF2C6C94BE1F8804B5DDF2084A07DE87EFE-net.java.html.sound-1.4.jar
	https://hg.netbeans.org/binaries/E5DDC5E827D3D62E7BE9F7E32927CA01F2839971-org.eclipse.osgi_3.9.1.v20140110-1610.jar
	https://hg.netbeans.org/binaries/1C7FE319052EF49126CF07D0DB6953CB7007229E-swing-layout-1.0.4-doc.zip
	https://hg.netbeans.org/binaries/AF022CBCACD8CBFCF946816441D1E7568D817745-testng-6.8.1-javadoc.zip
	https://hg.netbeans.org/binaries/BB25868BD6C724018FB0350688975EC3B53230EA-xhr4j-1.4.jar"
LICENSE="|| ( CDDL GPL-2-with-linking-exception )"
KEYWORDS="~amd64 ~x86"
IUSE=""
S="${WORKDIR}"

# oracle-jdk-bin is needed for now because of javafx which is not packaged separately yet
# [parseprojectxml] Distilling /var/tmp/portage/dev-java/netbeans-platform-9999_p20151108/work/nbbuild/build/public-package-jars/org-netbeans-libs-javafx.jar from [/var/tmp/portage/dev-java/netbeans-platform-9999_p20151108/work/nbbuild/netbeans/platform/modules/org-netbeans-libs-javafx.jar, /usr/lib64/icedtea8/jre/lib/ext/jfxrt.jar]
# [parseprojectxml] Classpath entry /usr/lib64/icedtea8/jre/lib/ext/jfxrt.jar does not exist; skipping
#  [nbmerge] Failed to build target: all-api.htmlui

CDEPEND="dev-java/hamcrest-core:1.3
	dev-java/javahelp:0
	dev-java/jna:4
	dev-java/junit:4[source]
	>=dev-java/osgi-core-api-5:0
	dev-java/osgi-compendium:0
	dev-java/swing-layout:1[source]
	dev-java/testng:0"
DEPEND="${CDEPEND}
	dev-java/oracle-jdk-bin:1.8[javafx]
	app-arch/unzip"
RDEPEND="${CDEPEND}
	virtual/jdk:1.8"

INSTALL_DIR="/usr/share/${PN}-${SLOT}"

EANT_BUILD_XML="nbbuild/build.xml"
EANT_BUILD_TARGET="rebuild-cluster"
EANT_EXTRA_ARGS="-Drebuild.cluster.name=nb.cluster.platform -Dext.binaries.downloaded=true -Djava.awt.headless=true -Dpermit.jdk8.builds=true"
EANT_FILTER_COMPILER="ecj-3.3 ecj-3.4 ecj-3.5 ecj-3.6 ecj-3.7"
JAVA_PKG_BSFIX="off"
JAVA_PKG_WANT_BUILD_VM="oracle-jdk-bin-1.8"
JAVA_PKG_WANT_SOURCE="1.7"
JAVA_PKG_WANT_TARGET="1.7"

src_unpack() {
	unpack $(basename ${SOURCE_URL})

	einfo "Deleting bundled jars..."
	find -name "*.jar" -type f -delete

	unpack netbeans-9999-r21-build.xml.patch.bz2

	pushd "${S}" >/dev/null || die
	ln -s "${DISTDIR}"/2F7553F50B0D14ED811B849C282DA8C1FFC32AAE-asm-all-5.0.1.jar libs.asm/external/asm-all-5.0.1.jar || die
	ln -s "${DISTDIR}"/1BA97A9FFD4A1DFF3E75B76CD3AE3D0EFF8493B7-felix-4.2.1.jar libs.felix/external/felix-4.2.1.jar || die
	ln -s "${DISTDIR}"/941A8BE4506C65F0A9001C08812FB7DA1E505E21-junit-4.12-javadoc.jar junitlib/external/junit-4.12-javadoc.jar || die
	ln -s "${DISTDIR}"/03800C0C31FD6828EA7D3F245B3A7C00E221AA22-ko4j-1.4.jar o.n.html.ko4j/external/ko4j-1.4.jar || die
	ln -s "${DISTDIR}"/F752490EC8F6CEC5B7E07947A1407CE8A8E63518-net.java.html-1.4.jar net.java.html/external/net.java.html-1.4.jar || die
	ln -s "${DISTDIR}"/DEABE58D6CDDD124BEA30E9B6E6BD48E90CD7AA1-net.java.html.boot-1.4.jar net.java.html.boot/external/net.java.html.boot-1.4.jar || die
	ln -s "${DISTDIR}"/A5ECB6F58BB276CF77FD0E18A07656508E7099B6-net.java.html.boot.fx-1.4.jar net.java.html.boot.fx/external/net.java.html.boot.fx-1.4.jar || die
	ln -s "${DISTDIR}"/5CC4FD2D576DEEC4F64E46BAA9097525BA4DF8D8-net.java.html.boot.script-1.4.jar net.java.html.boot.script/external/net.java.html.boot.script-1.4.jar || die
	ln -s "${DISTDIR}"/0C735D28C3C2F22A9EB86A1F682AAC38920A6356-net.java.html.geo-1.4.jar net.java.html.geo/external/net.java.html.geo-1.4.jar || die
	ln -s "${DISTDIR}"/CD15F35E44B6EC1CF8D7CC216870B70A71D88A1B-net.java.html.json-1.4.jar net.java.html.json/external/net.java.html.json-1.4.jar || die
	ln -s "${DISTDIR}"/D7902EF2C6C94BE1F8804B5DDF2084A07DE87EFE-net.java.html.sound-1.4.jar net.java.html.sound/external/net.java.html.sound-1.4.jar || die
	ln -s "${DISTDIR}"/E5DDC5E827D3D62E7BE9F7E32927CA01F2839971-org.eclipse.osgi_3.9.1.v20140110-1610.jar netbinox/external/org.eclipse.osgi_3.9.1.v20140110-1610.jar || die
	ln -s "${DISTDIR}"/1C7FE319052EF49126CF07D0DB6953CB7007229E-swing-layout-1.0.4-doc.zip o.jdesktop.layout/external/swing-layout-1.0.4-doc.zip || die
	ln -s "${DISTDIR}"/AF022CBCACD8CBFCF946816441D1E7568D817745-testng-6.8.1-javadoc.zip libs.testng/external/testng-6.8.1-javadoc.zip || die
	ln -s "${DISTDIR}"/BB25868BD6C724018FB0350688975EC3B53230EA-xhr4j-1.4.jar o.n.html.xhr4j/external/xhr4j-1.4.jar || die
	popd >/dev/null || die
}

src_prepare() {
	einfo "Deleting bundled class files..."
	find -name "*.class" -type f | xargs rm -vf

	# upstream jna jar contains bundled binary libraries so we disable that feature
	epatch netbeans-9999-r21-build.xml.patch

	einfo "Symlinking external libraries..."
	java-pkg_jar-from --into libs.junit4/external hamcrest-core-1.3 hamcrest-core.jar hamcrest-core-1.3.jar
	java-pkg_jar-from --into javahelp/external javahelp jhall.jar jhall-2.0_05.jar
	java-pkg_jar-from --into libs.jna/external jna-4 jna.jar jna-4.4.0.jar
	java-pkg_jar-from --into libs.jna.platform/external jna-4 jna-platform.jar jna-platform-4.4.0.jar
	java-pkg_jar-from --into libs.junit4/external junit-4 junit.jar junit-4.12.jar
	ln -s /usr/share/junit-4/sources/junit-src.zip junitlib/external/junit-4.12-sources.jar || die
	java-pkg_jar-from --into libs.osgi/external osgi-core-api osgi-core-api.jar osgi.core-5.0.0.jar
	java-pkg_jar-from --into libs.osgi/external osgi-compendium osgi-compendium.jar osgi.cmpn-4.2.jar
	java-pkg_jar-from --into o.jdesktop.layout/external swing-layout-1 swing-layout.jar swing-layout-1.0.4.jar
	ln -s /usr/share/swing-layout-1/sources/swing-layout-src.zip o.jdesktop.layout/external/swing-layout-1.0.4-src.zip || die
	java-pkg_jar-from --into libs.testng/external testng testng.jar testng-6.8.1-dist.jar

	java-pkg-2_src_prepare
	default
}

src_compile() {
	unset DISPLAY
	eant -f ${EANT_BUILD_XML} ${EANT_EXTRA_ARGS} ${EANT_BUILD_TARGET} || die "Compilation failed"
}

src_install() {
	pushd nbbuild/netbeans/platform >/dev/null || die

	java-pkg_dojar lib/*.jar
	grep -E "/platform$" ../moduleCluster.properties > "${D}"/${INSTALL_DIR}/moduleCluster.properties || die

	insinto ${INSTALL_DIR}
	doins -r *
	rm "${D}"/${INSTALL_DIR}/docs/junit-4.12-sources.jar || die
	dosym /usr/share/junit-4/sources/junit-src.zip ${INSTALL_DIR}/docs/junit-4.12-sources.jar
	rm "${D}"/${INSTALL_DIR}/docs/swing-layout-1.0.4-src.zip || die
	dosym /usr/share/swing-layout-1/sources/swing-layout-src.zip ${INSTALL_DIR}/docs/swing-layout-1.0.4-src.zip
	find "${D}"/${INSTALL_DIR} -name "*.exe" -delete
	find "${D}"/${INSTALL_DIR} -name "*.dll" -delete
	rm -fr "${D}"/modules/lib || die

	popd >/dev/null || die

	fperms 775 ${INSTALL_DIR}/lib/nbexec
	dosym ${INSTALL_DIR}/lib/nbexec /usr/bin/nbexec-${SLOT}

	local instdir="${D}"/${INSTALL_DIR}/modules/ext
	pushd "${instdir}" >/dev/null || die
	rm hamcrest-core-1.3.jar && java-pkg_jar-from --into "${instdir}" hamcrest-core-1.3 hamcrest-core.jar hamcrest-core-1.3.jar
	rm jhall-2.0_05.jar && java-pkg_jar-from --into "${instdir}" javahelp jhall.jar jhall-2.0_05.jar
	rm jna-4.4.0.jar && java-pkg_jar-from --into "${instdir}" jna-4 jna.jar jna-4.4.0.jar
	rm jna-platform-4.4.0.jar && java-pkg_jar-from --into "${instdir}" jna-4 jna-platform.jar jna-platform-4.4.0.jar
	rm junit-4.12.jar && java-pkg_jar-from --into "${instdir}" junit-4 junit.jar junit-4.12.jar
	rm osgi.cmpn-4.2.jar && java-pkg_jar-from --into "${instdir}" osgi-compendium osgi-compendium.jar osgi.cmpn-4.2.jar
	rm osgi.core-5.0.0.jar && java-pkg_jar-from --into "${instdir}" osgi-core-api osgi-core-api.jar osgi.core-5.0.0.jar
	rm swing-layout-1.0.4.jar && java-pkg_jar-from --into "${instdir}" swing-layout-1 swing-layout.jar swing-layout-1.0.4.jar
	rm testng-6.8.1-dist.jar && java-pkg_jar-from --into "${instdir}" testng testng.jar testng-6.8.1-dist.jar
	popd >/dev/null || die

	dosym ${INSTALL_DIR} /usr/share/netbeans-nb-${SLOT}/platform
}
