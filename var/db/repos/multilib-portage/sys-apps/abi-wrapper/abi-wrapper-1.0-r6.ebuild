# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=3

DESCRIPTION="Wraps binarys that behave abi dependand"
HOMEPAGE="https://www.gentoo.org"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

# nothing to strip
RESTRICT="strip"

src_unpack() {
	abis="${DEFAULT_ABI} ${MULTILIB_ABIS/${DEFAULT_ABI}}"
	sed "s/@HARDCODED_ABIS@/${abis}/" "${FILESDIR}"/abi-wrapper > "${WORKDIR}"/abi-wrapper
}

src_install() {
	into /
	dobin abi-wrapper || die
	insinto /usr/bin
	ln -s ../../bin/abi-wrapper "${ED}"usr/bin/abi-wrapper || die
	if [[ -L ${EROOT}/bin/bash ]] ; then
		for i in ${abis} ; do
			if [[ -x ${EROOT}/bin/bash-${i} ]] ; then
				newbin "${EROOT}"/bin/bash-${i} bash-abi-wrapper || die
				break
			fi
		done
	else
		newbin "${EROOT}"/bin/bash bash-abi-wrapper || die
	fi
	if [[ -L ${EROOT}/bin/readlink ]] ; then
		for i in ${abis} ; do
			if [[ -x ${EROOT}/bin/readlink-${i} ]] ; then
				newbin "${EROOT}"/bin/readlink-${i} readlink-abi-wrapper || die
				break
			fi
		done
	else
		newbin "${EROOT}"/bin/readlink readlink-abi-wrapper || die
	fi
}
