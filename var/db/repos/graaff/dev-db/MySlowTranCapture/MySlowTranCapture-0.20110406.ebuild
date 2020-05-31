# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GITHUB_USER=yoshinorim
GITHUB_PROJECT=MySlowTranCapture
GITHUB_COMMIT=5c7a311c2ce28bc462e6f4525a3948c9b653da66

DESCRIPTION="A tool to print MySQL transactions that take more than <n> milliseconds"
HOMEPAGE="http://yoshinorimatsunobu.blogspot.nl/2011/04/tracking-long-running-transactions-in.html"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

S="${WORKDIR}/${GITHUB_PROJECT}-${GITHUB_COMMIT}"

RDEPEND="net-libs/libpcap dev-libs/boost"
DEPEND="${RDEPEND}"

# Makefile does not respect CFLAGS etc.

src_install() {
	dodoc README
	dobin myslowtrancapture
}
