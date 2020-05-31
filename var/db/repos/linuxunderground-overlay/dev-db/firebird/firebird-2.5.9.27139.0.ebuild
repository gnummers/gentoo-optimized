# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils flag-o-matic multilib user

MY_P="${PN/f/F}-$(ver_rs 4 -)"
MY_PV="R$(ver_cut 1)_$(ver_cut 2)_$(ver_cut 3)"

DESCRIPTION="Relational database offering many ANSI SQL:2003 and some SQL:2008 features"
HOMEPAGE="http://www.firebirdsql.org/"
SRC_URI="https://github.com/FirebirdSQL/${PN}/releases/download/${MY_PV}/${MY_P}.tar.bz2"

LICENSE="IDPL Interbase-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug doc client examples superserver xinetd"

CDEPEND="dev-libs/libedit
	dev-libs/icu:="

DEPEND="${CDEPEND}
	>=dev-util/btyacc-3.0-r2
	doc? ( app-arch/unzip )"

RDEPEND="${CDEPEND}
	xinetd? ( virtual/inetd )
	!sys-cluster/ganglia"

RESTRICT="userpriv"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	enewgroup firebird 450
	enewuser firebird 450 /bin/sh /usr/$(get_libdir)/firebird firebird
}

check_sed() {
	MSG="sed of $3, required $2 lines modified $1"
	einfo "${MSG}"
	[[ $1 -ge $2 ]] || die "${MSG}"
}

src_prepare() {
	# This patch might be portable, and not need to be duplicated per version
	# also might no longer be necessary to patch deps or libs, just flags
	eapply "${FILESDIR}"/${PN}-2.5.9.27139.0-deps-flags.patch

	use client && eapply "${FILESDIR}"/${PN}-2.5.1.26351.0-client.patch
	use superserver || eapply "${FILESDIR}"/${PN}-2.5.1.26351.0-superclassic.patch
	eapply_user

	# Rename references to isql to fbsql
	# sed vs patch for portability and addtional location changes
	check_sed "$(sed -i -e 's:"isql :"fbsql :w /dev/stdout' \
		src/isql/isql.epp | wc -l)" "1" "src/isql/isql.epp" # 1 line
	check_sed "$(sed -i -e 's:isql :fbsql :w /dev/stdout' \
		src/msgs/history2.sql | wc -l)" "4" "src/msgs/history2.sql" # 4 lines
	check_sed "$(sed -i -e 's:--- ISQL:--- FBSQL:w /dev/stdout' \
		-e 's:isql :fbsql :w /dev/stdout' \
		-e 's:ISQL :FBSQL :w /dev/stdout' \
		src/msgs/messages2.sql | wc -l)" "6" "src/msgs/messages2.sql" # 6 lines

	rm -r "${S}"/extern/{btyacc,editline,icu} || die

	eautoreconf
}

src_configure() {
	filter-flags -fprefetch-loop-arrays
	filter-mfpmath sse

	econf \
		--prefix=/usr/$(get_libdir)/${PN} \
		$(use_enable superserver) \
		$(use_enable debug) \
		--with-editline \
		--with-system-editline \
		--with-system-icu \
		--with-fbbin=/usr/bin \
		--with-fbsbin=/usr/sbin \
		--with-fbconf=/etc/${PN} \
		--with-fblib=/usr/$(get_libdir) \
		--with-fbinclude=/usr/include \
		--with-fbdoc=/usr/share/doc/${P} \
		--with-fbudf=/usr/$(get_libdir)/${PN}/UDF \
		--with-fbsample=/usr/share/${PN}/examples \
		--with-fbsample-db=/usr/share/${PN}/examples/empbuild \
		--with-fbhelp=/usr/share/${PN}/help \
		--with-fbintl=/usr/$(get_libdir)/${PN}/intl \
		--with-fbmisc=/usr/share/${PN}/misc \
		--with-fbsecure-db=/etc/${PN} \
		--with-fbmsg=/usr/share/${PN}/msg \
		--with-fblog=/var/log/${PN}/ \
		--with-fbglock=/var/run/${PN} \
		--with-fbplugins=/usr/$(get_libdir)/${PN}/plugins \
		--with-gnu-ld
}

src_compile() {
	emake -j1
}

src_install() {
	use doc && dodoc -r doc

	cd "gen/${PN}" || die

	doheader include/*

	rm lib/libfbstatic.a || die "failed to remove libfbstatic.a"

	dolib.so lib/*.so*

	# links for backwards compatibility
	insinto /usr/$(get_libdir)
	dosym libfbclient.so /usr/$(get_libdir)/libgds.so
	dosym libfbclient.so /usr/$(get_libdir)/libgds.so.0
	dosym libfbclient.so /usr/$(get_libdir)/libfbclient.so.1

	insinto /usr/share/${PN}/msg
	doins *.msg

	use client && return

	einfo "Renaming isql -> fbsql"
	mv bin/isql bin/fbsql || die "failed to rename isql -> fbsql"

	local bins="fbsql fbsvcmgr fbtracemgr gbak gdef gfix gpre gsec gstat nbackup qli"
	for bin in ${bins}; do
		dobin bin/${bin}
	done

	dosbin bin/fb_lock_print
	# SuperServer
	if use superserver ; then
		dosbin bin/{fbguard,fbserver}
	# ClassicServer
	elif use xinetd ; then
		dosbin bin/fb_inet_server
	# SuperClassic
	else
		dosbin bin/{fbguard,fb_smp_server}
	fi

	insinto /usr/share/${PN}/help
	doins help/help.fdb

	exeinto /usr/$(get_libdir)/${PN}/intl
	doexe intl/libfbintl.so
	dosym libfbintl.so /usr/$(get_libdir)/${PN}/intl/fbintl.so
	insinto /usr/$(get_libdir)/${PN}/intl
	doins ../install/misc/fbintl.conf

	exeinto /usr/$(get_libdir)/${PN}/plugins
	doexe plugins/libfbtrace.so

	exeinto /usr/$(get_libdir)/${PN}/UDF
	doexe UDF/*.so

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	insinto /etc/${PN}
	doins ../install/misc/{aliases,fbtrace,firebird}.conf
	insopts -m0660 -o firebird -g firebird
	doins security2.fdb
	if use xinetd ; then
		insinto /etc/xinetd.d
		newins "${FILESDIR}/${PN}.xinetd" ${PN}
	else
		newinitd "${FILESDIR}/${PN}.init.d" ${PN}
	fi

	if use examples; then
		cd examples
		insinto /usr/share/${PN}/examples
		insopts -m0644 -o root -g root
		doins -r api
		doins -r dyn
		doins -r include
		doins -r stat
		doins -r udf
		doins functions.c
		doins README
		insinto /usr/share/${PN}/examples/empbuild
		insopts -m0660 -o firebird -g firebird
		doins empbuild/employee.fdb
	fi

	einfo "If you're using UDFs, please remember to move them"
	einfo "to /usr/lib/firebird/UDF"
}
