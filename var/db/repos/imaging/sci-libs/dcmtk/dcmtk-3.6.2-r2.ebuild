# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils eutils toolchain-funcs

DESCRIPTION="The DICOM Toolkit"
HOMEPAGE="http://dicom.offis.de/dcmtk.php.en"
SRC_URI="http://dicom.offis.de/download/${PN}/dcmtk362/${PN}-${PV}.tar.gz"
LICENSE="BSD"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="+c++11 doc png ssl tcpd +threads tiff xml zlib iconv"

RDEPEND="
	virtual/jpeg:*
	png? ( media-libs/libpng:0 )
	ssl? ( dev-libs/openssl:0 )
	tcpd? ( sys-apps/tcp-wrappers )
	tiff? ( media-libs/tiff:0 )
	xml? ( dev-libs/libxml2:2 )
	zlib? ( sys-libs/zlib )
	iconv? ( virtual/libiconv )
	c++11? ( || ( >=sys-devel/gcc-6.3.0 >=sys-devel/clang-3.9.1 ) )
	"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

PATCHES=(
	"${FILESDIR}"/soversion_abi.patch
	"${FILESDIR}"/gcc6-drop-cxx11-flags.patch
)

src_configure() {
	mycmakeargs="${mycmakeargs}
		-DBUILD_SHARED_LIBS=ON
		-DCMAKE_INSTALL_PREFIX=/usr
		-DDCMTK_INSTALL_LIBDIR:STRING=$(get_libdir)
		$(cmake-utils_use tiff DCMTK_WITH_TIFF)
		$(cmake-utils_use png DCMTK_WITH_PNG)
		$(cmake-utils_use xml DCMTK_WITH_XML)
		$(cmake-utils_use zlib DCMTK_WITH_ZLIB)
		$(cmake-utils_use iconv DCMTK_WITH_ICONV)
		$(cmake-utils_use ssl DCMTK_WITH_OPENSSL)
		$(cmake-utils_use doc DCMTK_WITH_DOXYGEN)
		$(cmake-utils_use threads DCMTK_WITH_THREADS)"

	if use c++11; then
		mycmakeargs="${mycmakeargs}
		-DDCMTK_USE_CXX11_STL:BOOL=ON
		-DDCMTK_ENABLE_CXX11:BOOL=ON"

		local compiler=$(tc-get-compiler-type)

		elog "Compiling with ${compiler}"
		if [[ "x${compiler}" == "xgcc" ]] ; then 
	            local gcc_mv=$(gcc-major-version)
		    elog "Using gcc major version $gcc_mv"
		    [[ "${gcc_mv}" < "6" ]] && die "Require at least gcc-6 to compile with c++11 support"
               fi
	fi

	cmake-utils_src_configure
	if use doc; then
		cd "${S}"/doxygen
		econf
	fi
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		emake -C "${S}"/doxygen || die
	fi
}

src_install() {
	cmake-utils_src_install
	if use doc; then
		cd "${S}"
		doman doxygen/manpages/man1/* || die
		dohtml -r doxygen/htmldocs/* || die
	fi
}
