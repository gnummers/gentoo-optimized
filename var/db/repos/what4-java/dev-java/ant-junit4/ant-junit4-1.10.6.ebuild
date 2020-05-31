# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ANT_TASK_JDKVER=1.9
ANT_TASK_JREVER=1.9
ANT_TASK_DEPNAME="junit-4"

inherit ant-tasks

KEYWORDS="-amd64 -arm -ppc64 -x86 -amd64-linux -x86-linux -ppc-macos -x64-macos -x86-macos -sparc-solaris -sparc64-solaris -x64-solaris -x86-solaris"

DEPEND="dev-java/junit:4
	~dev-java/ant-junit-${PV}"

RDEPEND="${DEPEND}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="junit-4,ant-junit"

src_compile() {
	eant jar-junit4
}

src_install() {
	# No registration as ant-task, would be loaded together with ant-junit.
	java-pkg_dojar build/lib/ant-junit4.jar

	# As we dont't want to depend on and-junit in package.env, because it depends
	# on junit:0. Instead, we "steal" its jar and record it to our package.env as
	# if it belongs to this package's classpath.
	java-pkg_getjar --build-only ant-junit ant-junit.jar
	java-pkg_regjar $(java-pkg_getjar --build-only ant-junit ant-junit.jar)
}
