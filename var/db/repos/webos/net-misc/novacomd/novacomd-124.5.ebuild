EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="Utility to communicate with a target device over USB or TCP/IP."
HOMEPAGE="https://github.com/openwebos/novacomd/"
SLOT="0"

KEYWORDS="x86 amd64"
LICENSE="Apache-2.0"
IUSE="upstart"

DEPEND="virtual/libusb:0"

PATCHES=( "${FILESDIR}/0011-Fix-USB-read-write-operations.patch" "${FILESDIR}/0011-Remove-verbose-output.patch" )

src_configure() {
	local mycmakeargs+=(
	    -DWEBOS_TARGET_MACHINE_IMPL=host
	)

	webos-cmake_src_configure
}

src_install() {
	cmake-utils_src_install

	if ! use upstart; then
		rm "${D}"/etc/event.d/novacomd || die "This install doesn't provide upstart file Novacomd. Please, re-check ebuild"

		dobin "${FILESDIR}/novaterm"
		newinitd "${FILESDIR}/novacomd" novacomd
	fi
}
