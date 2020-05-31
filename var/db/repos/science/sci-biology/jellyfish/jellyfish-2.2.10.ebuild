# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic autotools

DESCRIPTION="k-mer counter within reads for assemblies"
HOMEPAGE="http://www.genome.umd.edu/jellyfish.html"
SRC_URI="https://github.com/gmarcais/Jellyfish/releases/download/v${PV}/${P}.tar.gz"

# older version is hidden in trinityrnaseq_r20140413p1/trinity-plugins/jellyfish-1.1.11

LICENSE="GPL-3+ BSD"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_sse"

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare(){
	eautoreconf
	default
}

# TODO: enable compilation of Bindings to Ruby, Python and Perl
# '--enable-ruby-binding', '--enable-python-binding' or '--enable-perl-binding',  '--enable-swig'
src_configure(){
	#  --with-sse              enable SSE
	#  --with-half             enable half float (16 bits)
	#  --with-int128           enable int128
	local myconf
	use cpu_flags_x86_sse && myconf+=( --with-sse )
	econf ${myconf[@]}
}

src_install(){
	default
	mv "${ED}"/usr/bin/jellyfish "${ED}"/usr/bin/jellyfish2 || die
	sed -e "s#jellyfish-${PV}#jellyfish#" -i "${ED}/usr/$(get_libdir)"/pkgconfig/jellyfish-2.0.pc || die
	find "${ED}"/usr/include/"${P}"/"${PN}" -type f | while read f; do
		sed -e "s#include <jellyfish/#include <jellyfish${SLOT}/#" -i $f || die
	done
	mkdir -p "${ED}/usr/include/${PN}${SLOT}" || die
	mv "${ED}"/usr/include/"${P}"/"${PN}"/* "${ED}/usr/include/${PN}${SLOT}/" || die
	rm -r "${ED}/usr/include/${P}" || die
	mv "${ED}"/usr/share/man/man1/jellyfish.1 "${ED}"/usr/share/man/man1/jellyfish"${SLOT}".1 || die
	dodoc doc/jellyfish.pdf
}
