# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
XORG_EAUTORECONF=yes
inherit xorg-2

DESCRIPTION="Application startup notification and feedback library"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/startup-notification"
EGIT_REPO_URI="git://anongit.freedesktop.org/startup-notification"

LICENSE="LGPL-2 MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="x11-libs/libX11
	>x11-libs/libxcb-1.6
	>=x11-libs/xcb-util-0.3.8"
DEPEND="${RDEPEND}
	x11-proto/xproto"

DOCS=( AUTHORS ChangeLog NEWS doc/startup-notification.txt )
