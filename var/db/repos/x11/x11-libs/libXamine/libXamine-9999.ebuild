# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/libXamine"
DESCRIPTION="Protocol analysis library for the X Window System protocol"
HOMEPAGE="http://xcb.freedesktop.org/"
LICENSE="LGPL-2.1"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libxcb"
DEPEND="${RDEPEND}
	>=x11-proto/xcb-proto-9999"
