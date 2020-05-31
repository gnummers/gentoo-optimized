# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils

MyPN=secp256k1-zkp
DESCRIPTION="Experimental fork of libsecp256k1 with support for Pedersen commitments and range proofs"
HOMEPAGE="https://github.com/ElementsProject/secp256k1-zkp"
COMMITHASH="11af7015de624b010424273be3d91f117f172c82"
SRC_URI="${HOMEPAGE}/archive/${COMMITHASH}.tar.gz -> ${PN}-v${PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+asm ecdh endomorphism experimental generator gmp java musig rangeproof +recovery schnorrsig surjectionproof test test-openssl whitelist"
RESTRICT="!test? ( test )"

REQUIRED_USE="
	asm? ( || ( amd64 arm ) arm? ( experimental ) )
	ecdh? ( experimental )
	generator? ( experimental )
	java? ( ecdh )
	musig? ( experimental schnorrsig )
	rangeproof? ( experimental generator )
	schnorrsig? ( experimental )
	surjectionproof? ( experimental rangeproof )
	test-openssl? ( test )
	whitelist? ( experimental rangeproof )
"
RDEPEND="
	gmp? ( dev-libs/gmp:0= )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	java? ( virtual/jdk )
	test-openssl? ( dev-libs/openssl:0 )
"

S="${WORKDIR}/${MyPN}-${COMMITHASH}"

src_prepare() {
	default
	sed -e 's/\(\blibsecp256k1\)\([]._]\)/\1_zkp\2/g' \
		-i configure.ac Makefile.am src/modules/*/Makefile.am.include || die
	sed -e 's|^\(Description:\).*$|\1 '"${DESCRIPTION}"'|' \
		-e 's|^\(URL:\).*$|\1 '"${HOMEPAGE}"'|' \
		-e 's/secp256k1$/\0_zkp/' \
		-i libsecp256k1.pc.in || die
	mv libsecp256k1{,_zkp}.pc.in || die
	eautoreconf
}

src_configure() {
	local asm_opt
	if use asm; then
		if use arm; then
			asm_opt=arm
		else
			asm_opt=auto
		fi
	else
		asm_opt=no
	fi
	econf \
		--includedir="/usr/include/${MyPN//-/_}" \
		--disable-benchmark \
		$(use_enable experimental) \
		$(use_enable java jni) \
		$(use_enable test tests) \
		$(use_enable test-openssl openssl-tests) \
		$(use_enable endomorphism) \
		--with-asm=$asm_opt \
		--with-bignum=$(usex gmp gmp no) \
		$(use_enable {,module-}ecdh) \
		$(use_enable {,module-}generator) \
		$(use_enable {,module-}musig) \
		$(use_enable {,module-}rangeproof) \
		$(use_enable {,module-}recovery) \
		$(use_enable {,module-}schnorrsig) \
		$(use_enable {,module-}surjectionproof) \
		$(use_enable {,module-}whitelist) \
		--disable-static
}

src_install() {
	dodoc README.md
	emake DESTDIR="${D}" install
	find "${D}" -name '*.la' -delete || die
}
