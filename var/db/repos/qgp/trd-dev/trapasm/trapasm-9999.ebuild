# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils subversion

HOMEPAGE="http://alice.physi.uni-heidelberg.de/"

if [[ ${PV} == "9999" ]] ; then
	ESVN_REPO_URI="http://alice.physi.uni-heidelberg.de/svn/trd/TRAP_compilers/${PN}/trunk"
else
	ESVN_REPO_URI="http://alice.physi.uni-heidelberg.de/svn/trd/TRAP_compilers/${PN}/tags/${PV}"
fi;

DESCRIPTION="TRD TRAP assembler"

LICENSE=""

SLOT="0"

KEYWORDS=""

IUSE=""

DEPEND="dev-lang/fpc"
RDEPEND="${DEPEND}"
