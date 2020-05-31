# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{7,8}} )

inherit distutils-r1 git-r3

DESCRIPTION="Gettext file checker"
HOMEPAGE="https://github.com/flashcode/msgcheck/"
EGIT_REPO_URI="https://github.com/flashcode/msgcheck.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
DEPEND="sys-devel/gettext
dev-python/pyenchant"
