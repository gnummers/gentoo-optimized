# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Run commands in an environment faking root privileges"
HOMEPAGE="http://packages.qa.debian.org/f/fakeroot.html"
SRC_URI="mirror://debian/pool/main/f/fakeroot/${PF/-/_}.orig.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="test? ( app-arch/sharutils )"

DOCS="AUTHORS BUGS DEBUG README doc/README.saving"
