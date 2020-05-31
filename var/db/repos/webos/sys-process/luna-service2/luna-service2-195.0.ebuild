EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="Open webOS Luna System Bus library, daemon, and utilities"
HOMEPAGE="https://github.com/openwebos/luna-service2"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND=">=dev-util/cmake-modules-webos-19"

RDEPEND="
	>=dev-libs/libpbnjson-30
	dev-libs/pmloglib
"

PATCHES=( "${FILESDIR}/add_pmloglib_dependency.patch" )

src_install() {
	cmake-utils_src_install

	keepdir /usr/share/dbus-1/{system-,}services
	keepdir /var/palm/ls2/{roles,services}/{prv,pub}

	newinitd "${FILESDIR}/ls-hubd-prv" ls-hubd-prv
	newinitd "${FILESDIR}/ls-hubd-pub" ls-hubd-pub

	# remove even'd files as we doesn't support them
	rm "${D}"/etc/event.d/* || die "Can't remove event.d files, recheck ebuild"
	rmdir "${D}"/etc/event.d || die "Can't remove even't dir, ebuild error"

	# remove upstart files as we provide gentoo openrc script
	rm "${D}"/etc/init/* || die "Can't remove upstart scripts, recheck ebuild"
	rmdir "${D}"/etc/init || die "Can't remove /opt/webos/etc/init dir, recheck ebuild"
}
