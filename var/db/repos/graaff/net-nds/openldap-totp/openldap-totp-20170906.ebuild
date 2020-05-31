# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild provides the slapd module for totp in the OpenLDAP git
# repository.
# https://www.openldap.org/its/index.cgi/Incoming?id=8836;expression=totp
# tracks its inclusion in the OpenLDAP release media, at which point
# totp support should be added to the openldap ebuild.

COMMIT=2c36a37f908cd2e7297b1bd5621fea2f0d32451a

DESCRIPTION="provides support for RFC 6238 TOTP Time-based One Time Passwords in OpenLDAP"
HOMEPAGE="https://github.com/openldap/openldap/tree/master/contrib/slapd-modules/passwd/totp"
SRC_URI="https://github.com/openldap/openldap/archive/${COMMIT}.tar.gz"

LICENSE="OPENLDAP"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-nds/openldap"
RDEPEND="${DEPEND}"

S="${WORKDIR}/openldap-${COMMIT}"

src_prepare() {
	sed -i -e 's/^LIBS = .*/LIBS = -lldap -llber/' contrib/slapd-modules/passwd/totp/Makefile || die
	eapply_user
}

src_compile() {
	pushd include || die
	emake ldap_config.h
	popd || die
	pushd contrib/slapd-modules/passwd/totp || die
	emake
}

src_test() {
	:
}

src_install() {
	pushd contrib/slapd-modules/passwd/totp || die
	emake DESTDIR="${D}" libexecdir="${EPREFIX}/usr/$(get_libdir)/openldap" mandir="${EPREFIX}/usr/share" install
	dodoc README
}
