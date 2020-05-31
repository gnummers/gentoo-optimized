# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=BBC
MODULE_VERSION=1.19
inherit perl-module

DESCRIPTION="flatten/unflatten complex data hashes"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="
	test? (
		dev-perl/Test-Assertions
		dev-perl/Log-Trace
	)"
