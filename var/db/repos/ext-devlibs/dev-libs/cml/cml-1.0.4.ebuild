# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils versionator
DESCRIPTION="The CML (Configurable Math Library) is a C++ vector, matrix, and quaternion math library."
HOMEPAGE="http://www.cmldev.net/"

MY_PV=$(replace_all_version_separators '_')
MY_P="CML-${MY_PV}"
SRC_URI="https://github.com/demianmnave/CML/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_install() {
	dodir /usr/include/
	cp -R "${S}/cml" "${D}/usr/include" || die "install failed"
}
