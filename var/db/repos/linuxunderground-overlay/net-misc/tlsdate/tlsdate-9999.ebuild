# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools systemd git-r3 user

DESCRIPTION="Update local time over HTTPS"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/third_party/tlsdate"
EGIT_REPO_URI="https://chromium.googlesource.com/chromiumos/third_party/${PN}.git"

LICENSE="BSD"
SLOT="0"
IUSE="dbus +hardened +seccomp static-libs"

DEPEND="dev-libs/openssl:0=
	dev-libs/libevent:=
	dbus? ( sys-apps/dbus )"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-tlsdated-service.patch
)

src_prepare() {
	# Use the system cert store rather than a custom one specific
	# to the tlsdate package. #534394
	sed -i \
		-e 's:/tlsdate/ca-roots/tlsdate-ca-roots.conf:/ssl/certs/ca-certificates.crt:' \
		Makefile.am || die

	# Set a decent default host
	sed -i \
		-e 's:www.ptb.de:encrypted.google.com:' \
		src/tlsdate.h || die
	sed -i \
		-e 's:www.ptb.de:encrypted.google.com:' \
		etc/tlsdated.conf || die
	sed -i \
		-e 's:www.ptb.de:encrypted.google.com:' \
		man/tlsdate.1 || die

	default

	eautoreconf
}

src_configure() {
	econf \
		--disable-silent-rules \
		$(use_enable dbus) \
		$(use_enable seccomp seccomp-filter) \
		$(use_enable hardened hardened-checks) \
		--with-unpriv-user=tlsdate \
		--with-unpriv-group=tlsdate
}

src_install() {
	default

	# Use the system cert store; see src_prepare. #446426 #534394
	rm "${ED}"/etc/tlsdate/ca-roots/tlsdate-ca-roots.conf || die
	rmdir "${ED}"/etc/tlsdate/ca-roots || die

	newinitd "${FILESDIR}"/tlsdated.rc tlsdated
	newconfd "${FILESDIR}"/tlsdated.confd tlsdated
	newinitd "${FILESDIR}"/tlsdate.rc tlsdate
	newconfd "${FILESDIR}"/tlsdate.confd tlsdate

	systemd_newunit "${S}"/init/tlsdated.service tlsdated.service
	systemd_newtmpfilesd "${FILESDIR}"/tlsdated.tmpfiles.conf tlsdated.conf
	insinto /etc/default
	newins "${FILESDIR}"/tlsdated.default tlsdated

	insinto /etc/dbus-1/system.d/
	doins dbus/org.torproject.tlsdate.conf

	use static-libs || \
		find "${ED}"/usr '(' -name '*.la' -o -name '*.a' ')' -delete
}

pkg_preinst() {
	enewgroup tlsdate 124
	enewuser tlsdate 124 -1 /dev/null tlsdate
}
