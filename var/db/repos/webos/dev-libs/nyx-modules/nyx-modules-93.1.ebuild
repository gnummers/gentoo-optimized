EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="Open webOS portability layer - device specific modules"
HOMEPAGE="https://github.com/openwebos/nyx-modules"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"
DEPEND="dev-libs/glib
		dev-libs/nyx-lib"

src_install() {
	rm -f "${D}"/etc/udev/rules.d/99-nyx-modules.rules || die "Can't remove udev rule. Check ebuild"
	insinto /lib/udev/rules.d
	newins "${S}/files/conf/99-nyx-modules.rules" 99-nyx-modules.rules
}
