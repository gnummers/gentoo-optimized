# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=RKINYON
MODULE_VERSION=0.01
inherit perl-module

DESCRIPTION="Unify multiple subroutine references as a new one"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
PERL_RM_FILES=(
	t/998_pod.t
	t/999_pod_coverage.t
)
RDEPEND="
	>=virtual/perl-Carp-0.10.0
	>=dev-perl/Data-Dump-Streamer-0.10.0
	>=dev-perl/Sub-Name-0.10.0
"
DEPEND="
	${RDEPEND}
	dev-perl/Module-Build
	test? (
		>=virtual/perl-Test-Simple-0.470.0
	)
"
