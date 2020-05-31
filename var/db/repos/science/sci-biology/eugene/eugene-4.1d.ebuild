# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils

DESCRIPTION="Prokaryotic and Eukaryotic gene predictor"
HOMEPAGE="http://www.inra.fr/mia/T/EuGene/"
SRC_URI="https://mulcyber.toulouse.inra.fr/frs/download.php/1359/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/gd[png]
	media-libs/libpng:0=
	"
RDEPEND="${DEPEND}"

RESTRICT="test"

src_prepare() {
	# https://mulcyber.toulouse.inra.fr/tracker/index.php?func=detail&aid=1170
	epatch \
		"${FILESDIR}"/${PN}-3.6-overflow.patch \
		"${FILESDIR}"/${PN}-3.6-plugins.patch \
		"${FILESDIR}"/${PN}-4.1-format-security.patch
	sed \
		-e '/SUBDIRS/ s/doc//' \
		-e '/INSTALL.*doc/ s/\(.*\)//' \
		-i Makefile.am || die
	eautoreconf
}
