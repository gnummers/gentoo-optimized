EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="Creates the database schema for webos Applications"
HOMEPAGE="https://github.com/openwebos/configurator"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND="dev-db/db8
		dev-libs/pmloglib
		"

src_install() {
	cmake-utils_src_install

	rm -r "${D}"/etc/event.d || die "Can't remove event.d dir, please, recheck ebuild"
	rm -r "${D}"/etc/init || die "Can't remove init dir, please, recheck ebuild"

	newinitd "${FILESDIR}/configurator" configurator
}
