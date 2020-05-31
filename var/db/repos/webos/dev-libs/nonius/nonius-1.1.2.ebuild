EAPI=6
DESCRIPTION="Nonius is a framework for benchmarking small snippets of C++ code"
HOMEPAGE="https://nonius.io/"
SRC_URI="https://github.com/rmartinho/nonius/archive/v${PV}.tar.gz"
LICENSE="CC0"
KEYWORDS="x86 amd64"
SLOT=0

DEPEND="dev-util/ninja"

S="${WORKDIR}/nonius-1.1.2"

src_prepare() {
	eapply_user
	${S}/tools/bootstrap.py
	ninja
}

src_install() {
	dodir /usr/include/nonius
	cp "${S}/dist/nonius.h++" "${D}/usr/include/nonius"
}
