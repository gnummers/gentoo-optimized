# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils toolchain-funcs prefix

DESCRIPTION="Analysis of functional, structural, and diffusion MRI brain imaging data"
HOMEPAGE="http://www.fmrib.ox.ac.uk/fsl"
SRC_URI="https://dev.gentoo.org/~jlec/distfiles/${P}-sources.tar.gz"

LICENSE="FSL BSD-2 newmat"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="
	dev-libs/boost
	media-gfx/graphviz
	media-libs/gd
	media-libs/glu
	media-libs/libpng:0=
	sys-libs/zlib
	"
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}
	dev-lang/tcl:0=
	dev-lang/tk:0=
	"

S=${WORKDIR}/${PN}

src_prepare(){
	epatch \
		"${FILESDIR}/${PN}"-5.0.8-setup.patch \
		"${FILESDIR}/${PN}"-5.0.8-headers.patch \
		"${FILESDIR}/${PN}"-5.0.8-fsldir_redux.patch

	sed -i \
		-e "s:@@GENTOO_RANLIB@@:$(tc-getRANLIB):" \
		-e "s:@@GENTOO_CC@@:$(tc-getCC):" \
		-e "s:@@GENTOO_CXX@@:$(tc-getCXX):" \
		config/generic/systemvars.mk || die

	eprefixify $(grep -rl GENTOO_PORTAGE_EPREFIX src/*) \
		etc/js/label-div.html

	makefilelist=$(find src/ -name Makefile)

	sed -i \
		-e "s:-I\${INC_BOOST}::" \
		-e "s:-I\${INC_ZLIB}::" \
		-e "s:-I\${INC_GD}::" \
		-e "s:-I\${INC_PNG}::" \
		-e "s:-L\${LIB_GD}::" \
		-e "s:-L\${LIB_PNG}::" \
		-e "s:-L\${LIB_ZLIB}::" \
		${makefilelist} || die

	sed -i "s:\${FSLDIR}/bin/::g" \
		$(grep -rl "\${FSLDIR}/bin" src/*) \
		$(grep -rl "\${FSLDIR}/bin" etc/matlab/*)
	sed -i "s:\$FSLDIR/bin/::g" \
		$(grep -rl "\$FSLDIR/bin" src/*) \
		$(grep -rl "\$FSLDIR/bin" etc/matlab/*)

	sed -i "s:\$FSLDIR/data:${EPREFIX}/usr/share/fsl/data:g" \
		$(grep -rl "\$FSLDIR/data" src/*)

	sed -i "s:\${FSLDIR}/data:${EPREFIX}/usr/share/fsl/data:g" \
		$(grep -rl "\${FSLDIR}/data" src/*)

	sed -i "s:\$FSLDIR/etc:${EPREFIX}/etc:g" \
		$(grep -rl "\$FSLDIR/etc" src/*)

	sed -i "s:\${FSLDIR}/etc:${EPREFIX}/etc:g" \
		$(grep -rl "\${FSLDIR}/etc" src/*)

	sed -i "s:\$FSLDIR/doc:${EPREFIX}/usr/share/fsl/doc:g" \
		$(grep -rl "\$FSLDIR/doc" src/*)

	sed -i "s:\${FSLDIR}/doc:${EPREFIX}/usr/share/fsl/doc:g" \
		$(grep -rl "\${FSLDIR}/doc" src/*)

	sed -i "s:\'\${FSLDIR}\'/doc:${EPREFIX}/usr/share/fsl/doc:g" \
		$(grep -rl "\'\${FSLDIR}\'/doc" src/*)

	sed -i -e "s:\$FSLDIR/etc:/etc:g" `grep -rlI \$FSLDIR/etc *`
	default
}

src_compile() {
	export FSLDIR=${WORKDIR}/${PN}
	export FSLCONDIR=${WORKDIR}/${PN}/config
	export FSLMACHTYPE=generic

	export USERLDFLAGS="${LDFLAGS}"
	export USERCFLAGS="${CFLAGS}"
	export USERCXXFLAGS="${CXXFLAGS}"

	./build || die
}

src_install() {
	sed -i "s:\${FSLDIR}/tcl:/usr/libexec/fsl:g" \
		$(grep -lI "\${FSLDIR}/tcl" bin/*) \
		$(grep -l "\${FSLDIR}/tcl"  tcl/*) || die
	sed -i "s:\$FSLDIR/tcl:/usr/libexec/fsl:g" \
		$(grep -l "\$FSLDIR/tcl" tcl/*) || die

	dobin bin/*

	insinto /usr/share/${PN}
	doins -r data
	dodoc -r doc/. refdoc

	insinto /usr/libexec/fsl
	doins -r tcl/*

	insinto /etc/fslconf
	doins etc/fslconf/fsl.sh

	insinto /etc
	doins etc/fslversion
	doins -r etc/default_flobs.flobs etc/flirtsch etc/js etc/luts
	#if use matlab; then
	#	doins etc/matlab
	#fi

	#the following is needed for FSL and depending programs to be able
	#to find its files, since FSL uses an uncommon:
	#https://github.com/gentoo-science/sci/pull/612#r60289295
	dosym ../../../etc /usr/share/fsl/etc
	dosym ../doc/${P} /usr/share/fsl/doc

	cp "${FILESDIR}"/99fsl "${TMPDIR}"/99fsl || die
	eprefixify "${TMPDIR}"/99fsl
	doenvd "${TMPDIR}"/99fsl
	mv "${ED}"/usr/bin/{,fsl_}cluster || die
}

pkg_postinst() {
	echo
	einfo "Please run the following commands if you"
	einfo "intend to use fsl from an existing shell:"
	einfo "env-update && source /etc/profile"
	echo
}
