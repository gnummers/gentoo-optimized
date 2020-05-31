EAPI=5
inherit webos-cmake webos-github

DESCRIPTION="Open webOS Luna System Bus library, daemon, and utilities"
HOMEPAGE="https://github.com/openwebos/luna-prefs"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND="sys-process/luna-service2"

src_install() {
	cmake-utils_src_install

	# # remove even'd files as we doesn't support them
	# rm "${D}"/etc/event.d/* || die "Can't remove event.d files, recheck ebuild"
	# rmdir "${D}"/etc/event.d || die "Can't remove even't dir, ebuild error"

	# # remove upstart files as we provide gentoo openrc script
	# rm "${D}"/etc/init/* || die "Can't remove upstart scripts, recheck ebuild"
	# rmdir "${D}"/etc/init || die "Can't remove /opt/webos/etc/init dir, recheck ebuild"
}

