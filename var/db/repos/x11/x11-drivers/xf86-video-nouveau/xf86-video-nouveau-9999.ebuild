# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
XORG_DRI="always"
inherit linux-info xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/nouveau/${PN}"

DESCRIPTION="Accelerated Open Source driver for nVidia cards"
HOMEPAGE="http://nouveau.freedesktop.org/"
SRC_URI=""

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/libdrm-2.4.60[video_cards_nouveau]"
DEPEND="${RDEPEND}"
