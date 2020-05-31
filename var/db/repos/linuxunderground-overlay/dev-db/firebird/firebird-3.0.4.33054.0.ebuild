# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic multilib user

MY_P="${PN/f/F}-$(ver_rs 4 -)"
MY_PV="R$(ver_cut 1)_$(ver_cut 2)_$(ver_cut 3)"

DESCRIPTION="Relational database offering many ANSI SQL:2003 and some SQL:2008 features"
HOMEPAGE="http://www.firebirdsql.org/"
SRC_URI="https://github.com/FirebirdSQL/${PN}/releases/download/${MY_PV}/${MY_P}.tar.bz2"

LICENSE="IDPL Interbase-1.0"
SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="doc examples +server xinetd"

CDEPEND="dev-libs/libtommath
	dev-libs/libedit
	dev-libs/icu:="

DEPEND="${CDEPEND}"

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
	if [[ -e /var/run/${PN}/${PN}.pid ]] ; then
		ewarn
		ewarn "The presence of server connections may prevent isql or gsec"
		ewarn "from establishing an embedded connection. Accordingly,"
		ewarn "creating employee.fdb or security3.fdb could fail."
		ewarn "It is more secure to stop firebird daemon before running emerge."
		ewarn
	fi

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

	sed -i -e 's|-ggdb ||g' \
			-e 's|-pipe ||g' \
			-e 's|$(COMMON_FLAGS) $(OPTIMIZE_FLAGS)|$(COMMON_FLAGS)|g' \
			builds/posix/prefix.linux* || die

	sed -i -e "s|\$(this)|/usr/$(get_libdir)/firebird/intl|g" \
			builds/install/misc/fbintl.conf
	sed -i -e "s|\$(this)|/usr/$(get_libdir)/firebird/plugins|g" \
			src/plugins/udr_engine/udr_engine.conf

	# Building and using embedded btyacc avoids running eautoreconf
	# eapply "${FILESDIR}"/deps-flags.patch
	# rm -rf "${S}"/extern || die
	# eautoreconf
}

src_configure() {
	filter-flags -fprefetch-loop-arrays

	# Do not use $(get_libdir) in econf
	econf \
		--prefix=/usr/lib/${PN} \
		--with-editline \
		--with-system-editline \
		--with-fbbin=/usr/bin \
		--with-fbsbin=/usr/sbin \
		--with-fbconf=/etc/${PN} \
		--with-fblib=/usr/lib \
		--with-fbinclude=/usr/include \
		--with-fbdoc=/usr/share/doc/${P} \
		--with-fbudf=/usr/lib/${PN}/UDF \
		--with-fbsample=/usr/share/${PN}/examples \
		--with-fbsample-db=/usr/share/${PN}/examples/empbuild \
		--with-fbhelp=/usr/share/${PN}/help \
		--with-fbintl=/usr/lib/${PN}/intl \
		--with-fbmisc=/usr/share/${PN}/misc \
		--with-fbsecure-db=/etc/${PN} \
		--with-fbmsg=/usr/share/${PN}/msg \
		--with-fblog=/var/log/${PN} \
		--with-fbglock=/var/run/${PN} \
		--with-fbplugins=/usr/lib/${PN}/plugins \
		--with-gnu-ld
}

src_install() {
	use doc && dodoc -r doc

	cd "${S}/gen/Release/${PN}" || die

	doheader include/*
	dolib.so lib/*.so*

	# links for backwards compatibility
	insinto /usr/$(get_libdir)
	dosym libfbclient.so /usr/$(get_libdir)/libgds.so
	dosym libfbclient.so /usr/$(get_libdir)/libgds.so.0
	dosym libfbclient.so /usr/$(get_libdir)/libfbclient.so.1

	insinto /usr/share/${PN}/msg
	doins *.msg

	use server || return

	einfo "Renaming isql -> fbsql"
	mv bin/isql bin/fbsql || die "failed to rename isql -> fbsql"

	local bins="fbsql fbsvcmgr fbtracemgr gbak gfix gpre gsec gsplit gstat nbackup qli"
	for bin in ${bins}; do
		dobin bin/${bin}
	done

	dosbin bin/{firebird,fbguard,fb_lock_print}

	insinto /usr/share/${PN}/help
	insopts -m0660 -o firebird -g firebird
	doins help/help.fdb

	exeinto /usr/$(get_libdir)/${PN}/intl
	doexe intl/libfbintl.so
	dosym libfbintl.so /usr/$(get_libdir)/${PN}/intl/fbintl.so
	insinto /usr/$(get_libdir)/${PN}/intl
	insopts -m0644 -o root -g root
	doins intl/fbintl.conf

	# install plugins
	exeinto /usr/$(get_libdir)/${PN}/plugins
	doexe plugins/*.so
	exeinto /usr/$(get_libdir)/${PN}/plugins/udr
	doexe plugins/udr/*.so

	exeinto /usr/$(get_libdir)/${PN}/UDF
	doexe UDF/*.so

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	# install conf files
	insinto /etc/${PN}/plugins
	doins plugins/udr_engine.conf

	insinto /etc/${PN}
	doins {databases,fbtrace,firebird,plugins}.conf

	# install secutity3.fdb
	insopts -m0660 -o firebird -g firebird
	doins security3.fdb

	if use xinetd; then
		insinto /etc/xinetd.d
		newins "${FILESDIR}/${PN}.xinetd.3" ${PN}
	else
		newinitd "${FILESDIR}/${PN}.init.d" ${PN}
	fi

	if use examples; then
		cd examples
		insinto /usr/share/${PN}/examples
		insopts -m0644 -o root -g root
		doins -r api
		doins -r dbcrypt
		doins -r include
		doins -r interfaces
		doins -r package
		doins -r stat
		doins -r udf
		doins -r udr
		doins CMakeLists.txt
		doins functions.c
		doins README
		insinto /usr/share/${PN}/examples/empbuild
		insopts -m0660 -o firebird -g firebird
		doins empbuild/employee.fdb
	fi

	einfo "Starting with version 3, server mode is set in firebird.conf"
	einfo "Currently set to default : superserver"
	einfo "If you're using UDFs, please remember to move them"
	einfo "to /usr/lib/firebird/UDF"
}
