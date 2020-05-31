# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=MADCAT
MODULE_VERSION=1.27
inherit perl-module

DESCRIPTION='A plugin to make authentication a bit easier'

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RDEPEND="
	dev-perl/Mojolicious
"
DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test-Simple
	)
"
