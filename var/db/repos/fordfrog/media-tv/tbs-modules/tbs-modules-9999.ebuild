# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# THIS IS WORK IN PROGRESS, IT MIGHT NOT EVEN COMPILE

EAPI=6

inherit eutils linux-mod git-r3

DESCRIPTION="Kernel Modules for TBS DTV devices"
HOMEPAGE="https://www.tbsdtv.com/"
GIT_REPO_MEDIA_BUILD="https://github.com/tbsdtv/media_build.git"
GIT_REPO_LINUX_MEDIA="https://github.com/tbsdtv/linux_media.git"
GIT_LINUX_MEDIA_BRANCH="latest"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-perl/Proc-ProcessTable
	dev-util/patchutils"

S="${WORKDIR}/media_build"

src_unpack() {
	git-r3_fetch ${GIT_REPO_MEDIA_BUILD} refs/heads/master
	git-r3_checkout ${GIT_REPO_MEDIA_BUILD} "${WORKDIR}/media_build"

	git-r3_fetch ${GIT_REPO_LINUX_MEDIA} refs/heads/${GIT_LINUX_MEDIA_BRANCH}
	git-r3_checkout ${GIT_REPO_LINUX_MEDIA} "${WORKDIR}/media"

	ln -s /usr/src/linux "${WORKDIR}/linux"
}

src_compile() {
	emake dir DIR=../media
	emake
}

src_install() {
	linux-mod_src_install
}
