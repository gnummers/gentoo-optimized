# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs multilib

DESCRIPTION="Source-code libraries for standards-based RTP/RTCP/RTSP multimedia streaming, suitable for embedded and/or low-cost streaming applications"
HOMEPAGE="http://www.live555.com/"
SRC_URI="http://www.live555.com/liveMedia/public/${P/-/.}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

S="${WORKDIR}"

# Alexis Ballier <aballier@gentoo.org>
# Be careful, bump this everytime you bump the package and the ABI has changed.
# If you don't know, ask someone.
LIVE_ABI_VERSION=3

src_prepare() {
	epatch "${FILESDIR}"/${P}-buildorder.patch

	cp -pPR live live-shared || die
	pushd live-shared || die
	# To build shared libraries with proper NEEDED entries, we need
	# these libraries to link to eachother. This patch does this.
	epatch "${FILESDIR}"/${PN}-2009.06.02-libdeps.patch
	popd || die

	mv live live-static || die

	cp "${FILESDIR}"/config.gentoo-r1 live-static/ || die
	cp "${FILESDIR}"/config.gentoo-so-r2 live-shared/ || die

	case ${CHOST} in
		*-solaris*)
			sed -i \
				-e '/^COMPILE_OPTS /s/$/ -DSOLARIS/' \
				-e '/^LIBS_FOR_CONSOLE_APPLICATION /s/$/ -lsocket -lnsl/' \
				live-static/config.gentoo-r1 \
				live-shared/config.gentoo-so-r2 \
				|| die
		;;
		*-darwin*)
			sed -i \
				-e '/^COMPILE_OPTS /s/$/ -DBSD=1 -DHAVE_SOCKADDR_LEN=1/' \
				-e '/^LINK /s/$/ /' \
				-e '/^LIBRARY_LINK /s/$/ /' \
				-e '/^LIBRARY_LINK_OPTS /s/-Bstatic//' \
				live-static/config.gentoo-r1 \
				|| die static
			sed -i \
				-e '/^COMPILE_OPTS /s/$/ -DBSD=1 -DHAVE_SOCKADDR_LEN=1/' \
				-e '/^LINK /s/$/ /' \
				-e '/^LIBRARY_LINK /s/=.*$/= $(CXX) -o /' \
				-e '/^LIBRARY_LINK_OPTS /s:-shared.*$:-undefined suppress -flat_namespace -dynamiclib -install_name '"${EPREFIX}/usr/$(get_libdir)/"'$@:' \
				live-shared/config.gentoo-so-r2 \
				|| die shared
		;;
	esac
}

src_configure() {
	tc-export CC CXX
	export LIVE_ABI_VERSION LIBDIR=/usr/"$(get_libdir)"

	cd "${WORKDIR}"/${PN}-static || die
	./genMakefiles gentoo-r1 || die

	cd "${WORKDIR}"/${PN}-shared || die
	./genMakefiles gentoo-so-r2 || die
}

src_compile() {
	einfo "Beginning static library build"
	emake -C ${PN}-static -j1 TESTPROGS_APP= MEDIA_SERVER_APP=

	einfo "Beginning shared library build"
	emake -C ${PN}-shared -j1 TESTPROGS_APP= MEDIA_SERVER_APP=

	einfo "Beginning programs build"
	emake -C ${PN}-shared/testProgs
	emake -C ${PN}-shared/mediaServer
}

src_install() {
	for library in UsageEnvironment liveMedia BasicUsageEnvironment groupsock; do
		dolib.a live-static/${library}/lib${library}.a

		mv ${PN}-shared/${library}/lib${library}.so{,.${LIVE_ABI_VERSION}} || die
		dolib.so ${PN}-shared/${library}/lib${library}.so.${LIVE_ABI_VERSION}
		dosym lib${library}.so.${LIVE_ABI_VERSION} /usr/$(get_libdir)/lib${library}.so

		insinto /usr/include/${library}
		doins live-shared/${library}/include/*h
	done

	# Should we really install these?
	find live-shared/testProgs -type f -perm +111 -print0 | \
		xargs -0 dobin

	#install included live555MediaServer aplication
	dobin live-shared/mediaServer/live555MediaServer

	# install docs
	dodoc live-static/README
}

pkg_postinst() {
	ewarn "If you are upgrading from a version prior to live-2008.02.08"
	ewarn "Please make sure to rebuild applications built against ${PN}"
	ewarn "like vlc or mplayer. ${PN} may have had ABI changes and ${PN}"
	ewarn "support might be broken."
}
