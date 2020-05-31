# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="an implementation of the TLS/SSL protocols"
HOMEPAGE="https://github.com/awslabs/s2n"
if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/awslabs/s2n.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	sed -i \
		-e 's:-I/usr/include::' \
		-e 's:-Werror:-Wno-error:g' \
		s2n.mk || die
}

src_compile() {
	emake bin
}

src_install() {
	dolib.so lib/libs2n.so
	dolib.a	lib/libs2n.a

	insinto /usr/include
	doins api/s2n.h
}
