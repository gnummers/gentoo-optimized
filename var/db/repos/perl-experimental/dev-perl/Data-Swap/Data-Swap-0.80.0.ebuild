# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=XMATH
MODULE_VERSION=0.08
inherit perl-module

DESCRIPTION="Swap type and contents of variables"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	test? (
		virtual/perl-File-Spec
		virtual/perl-Test-Simple
	)
"