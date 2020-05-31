# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit  cmake-utils

DESCRIPTION="Maxflow "
HOMEPAGE="https://github.com/gerddie/maxflow"
SRC_URI="https://github.com/gerddie/maxflow/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
