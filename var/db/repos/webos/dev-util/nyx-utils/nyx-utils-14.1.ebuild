EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="Utility to invoke nyx library device type commands."
HOMEPAGE="https://github.com/openwebos/nyx-utils"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"
DEPEND="dev-libs/glib
		dev-libs/nyx-lib"

src_install() {
    cmake-utils_src_install

	rm -f "${D}"/etc/init/nyx-utils.conf || die "This install doesn't provide upstart file Novacomd. Please, re-check ebuild"
	rm -f "${D}"/etc/event.d/nyx-utils || die "This install doesn't provide upstart file Novacomd. Please, re-check ebuild"

	newinitd "${FILESDIR}/nyx-utils" nyx-utils
}

