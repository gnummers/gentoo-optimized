# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=JTPALMER
inherit perl-module

DESCRIPTION="Retrieve stock quotes using the IEX API"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-perl/Finance-Quote"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker"

src_test() {
	if ! has network ${DIST_TEST_OVERRIDE:-${DIST_TEST:-do parallel}}; then
		einfo "Disabling network tests without DIST_TEST_OVERRIDE=~network"
	else
		export ONLINE_TEST=1
	fi
	perl-module_src_test
}
