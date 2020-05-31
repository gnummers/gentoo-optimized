# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=MAKIS
MODULE_VERSION=0.03
inherit perl-module

DESCRIPTION="Perl extension for creating random strings"
LICENSE="|| ( Artistic GPL-2 )"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="virtual/perl-Test-Simple"
DEPEND="$RDEPEND"

PERL_RM_FILES=(
	t/pod-coverage.t
	t/pod.t
)
SRC_TEST=do
