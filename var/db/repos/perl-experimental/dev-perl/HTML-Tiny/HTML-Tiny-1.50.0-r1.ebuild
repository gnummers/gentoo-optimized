# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=ANDYA
MODULE_VERSION=1.05
inherit perl-module

DESCRIPTION="Lightweight, dependency free HTML/XML generation"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RDEPEND=""
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"
