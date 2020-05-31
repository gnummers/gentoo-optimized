EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="C library for asynchronous network sockets"
HOMEPAGE="https://github.com/openwebos/libpalmsocket"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND="
	net-dns/c-ares
	dev-libs/pmstatemachineengine
	dev-libs/glib
    dev-libs/pmloglib
"
