# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ANT_TASK_JDKVER=1.9
ANT_TASK_JREVER=1.9

inherit ant-tasks

KEYWORDS="-amd64 -arm -ppc64 -x86 -amd64-linux -x86-linux -ppc-macos -x64-macos -x86-macos -sparc-solaris -sparc64-solaris -x64-solaris -x86-solaris"

DEPEND="dev-java/junit:4"
RDEPEND="${DEPEND}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="junit-4"

src_compile() {
	eant jar-junit
}
