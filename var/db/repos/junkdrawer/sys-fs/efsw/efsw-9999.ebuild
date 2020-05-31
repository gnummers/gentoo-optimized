# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="C++ cross-platform file system watcher and notifier"
HOMEPAGE="https://bitbucket.org/SpartanJ/efsw"

if [[ ${PV} == 9999 ]]; then
	inherit mercurial
	EHG_REPO_URI="https://bitbucket.org/SpartanJ/efsw"
else
	SRC_URI=""
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="debug static-libs"

DEPEND="dev-util/premake:4"

src_prepare() {
	default
	premake4 gmake || die
}

src_compile() {
	local myconf="efsw-shared-lib"
	# config=relwithdbginfo is unstripped release
	use !debug && myconf+=" config=relwithdbginfo"
	use static-libs && myconf+=" efsw-static-lib"
	emake -C make/linux ARCH="" ${myconf}
}

src_install() {
	insinto /usr/include/efsw
	doins include/efsw/*.h

	dolib lib/libefsw.so*

	if use static-libs ; then
		dolib lib/libefsw.a
	fi
}
