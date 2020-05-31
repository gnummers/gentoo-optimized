# Copyright 2010-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils unpacker

DESCRIPTION="Simple cross platform GUI for Rclone"
HOMEPAGE="https://github.com/mmozeiko/RcloneBrowser"
SRC_URI="
        amd64? ( https://github.com/mmozeiko/RcloneBrowser/releases/download/1.2/rclone-browser_1.2_amd64.deb )
        x86? ( https://github.com/mmozeiko/RcloneBrowser/releases/download/1.2/rclone-browser_1.2_i386.deb )
"


SLOT="0"
KEYWORDS="-* ~x86 ~amd64"

RESTRICT="mirror bindist strip"
RDEPEND="
  dev-qt/qtgui:5
  net-misc/rclone
"

S="${WORKDIR}"

src_unpack() {
    unpack_deb ${A}
}

src_install(){
	doins -r usr
	fperms 755 /usr/bin/rclone-browser
}
