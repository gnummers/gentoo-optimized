# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils subversion

HOMEPAGE="http://alice.physi.uni-heidelberg.de/"

if [[ ${PV} == "9999" ]] ; then
	ESVN_REPO_URI="http://alice.physi.uni-heidelberg.de/svn/trd/libTRD/trunk"
else
	ESVN_REPO_URI="http://alice.physi.uni-heidelberg.de/svn/trd/libTRD/tags/${PV}"
fi;
ESVN_BOOTSTRAP="./bootstrap"

DESCRIPTION="TRD TRAP configuration compiler"

LICENSE=""

SLOT="0"

MAKEOPTS="-j1"

KEYWORDS=""

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
