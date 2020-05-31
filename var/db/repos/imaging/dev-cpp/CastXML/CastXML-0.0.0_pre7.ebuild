# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit  cmake-utils

DESCRIPTION="CastXML is a C-family abstract syntax tree XML output tool."
HOMEPAGE="https://github.com/CastXML/CastXML"
SRC_URI="https://github.com/gerddie/CastXML/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPENDS="${RDEPENDS}
	"

RDEPENDS="dev-libs/glib:2
		  dev-libs/libxml2
		  sys-devel/llvm:=
	"

PATCHES=(
	"${FILESDIR}/0001-Also-search-for-the-clang-resource-directory-in-a-si.patch"
)

