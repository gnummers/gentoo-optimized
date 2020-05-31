# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=MRAMBERG
MODULE_VERSION=0.04
inherit perl-module

DESCRIPTION="Update Class::DBI data using Data::FormValidator or HTML Widget"
LICENSE="|| ( Artistic GPL-2 )"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="
	dev-perl/Class-DBI
	dev-perl/Data-FormValidator
"
DEPEND="$RDEPEND"

SRC_TEST=do
