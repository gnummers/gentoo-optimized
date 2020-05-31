# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_OPT_USE="gui"
VIRTUALX_REQUIRED="manual"

inherit autotools bash-completion-r1 check-reqs eutils flag-o-matic \
	fortran-2 java-pkg-opt-2 pax-utils toolchain-funcs virtualx xdg-utils

DESCRIPTION="Scientific software package for numerical computations"
HOMEPAGE="http://www.scilab.org/"
SRC_URI="http://www.scilab.org/download/${PV}/${P}-src.tar.gz"

LICENSE="CeCILL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="bash-completion debug doc emf fftw +gui +matio mpi nls openmp
	static-libs test tk +umfpack +xcos"
REQUIRED_USE="xcos? ( gui ) doc? ( gui )"

RESTRICT="test"

IUSE_L10N="fr zh zh ru ca de es pt ja it uk pl cs"
L10N_DOC="fr pt ja ru"

map_lang() {
	local lang=${1/_/-}
	case $1 in
		# Retain the following, which have a specific subtag
		de_*|en_*|pt_*|zh_*) ;;
		# Consider all other xx_XX as duplicates of the generic xx tag
		*_*) lang=${1%%_*} ;;
	esac
	echo ${lang}
}

prev_l=
for l in ${IUSE_L10N}; do
	l=$(map_lang ${l})
	[[ ${l} != "${prev_l}" ]] && IUSE+=" l10n_${l}"
	prev_l=${l}
done
unset l prev_l

CDEPEND="
	dev-libs/libpcre
	dev-libs/libxml2:2
	sci-libs/hdf5[mpi=]
	>=sci-libs/arpack-3
	sys-devel/gettext
	sys-libs/ncurses:0=
	sys-libs/readline:0=
	virtual/lapack
	emf? (
		dev-java/freehep-graphicsio:0
		dev-java/freehep-graphicsio-emf:0
		dev-java/freehep-graphics2d:0
		dev-java/freehep-io:0
		dev-java/freehep-graphicsbase:0
	)
	fftw? ( sci-libs/fftw:3.0 )
	gui? (
		dev-java/avalon-framework:4.2
		>=dev-java/batik-1.8-r2:1.8
		dev-java/commons-io:1
		dev-java/commons-logging:0
		>=dev-java/flexdock-1.2.4:0
		>=dev-java/fop-2.0:0
		=dev-java/gluegen-2.2.4:2.2
		dev-java/javahelp:0
		dev-java/jeuclid-core:0
		dev-java/jgoodies-looks:2.6
		>=dev-java/jlatexmath-1.0.3:1
		>=dev-java/jlatexmath-fop-1.0.3:1
		=dev-java/jogl-2.2.4:2.2
		>=dev-java/jrosetta-1.0.4:0
		dev-java/skinlf:0
		dev-java/xmlgraphics-commons:2
		virtual/opengl
		xcos? ( dev-java/jgraphx:2.5 )
		)
	matio? ( >=sci-libs/matio-1.5 )
	tk? ( dev-lang/tk:0= )
	umfpack? ( sci-libs/umfpack )"

RDEPEND="${CDEPEND}
	gui? ( >=virtual/jre-1.5 )"

DEPEND="${CDEPEND}
	virtual/pkgconfig
	debug? ( dev-util/lcov )
	gui? (
		>=virtual/jdk-1.6
		doc? ( app-text/docbook-xsl-stylesheets
			   dev-java/xml-commons-external:1.4
			   dev-java/saxon:9 )
		xcos? ( dev-lang/ocaml )
		)
	test? (
		dev-java/junit:4
		gui? ( ${VIRTUALX_DEPEND} ) )"

DOCS=( "ACKNOWLEDGEMENTS" "README_Unix" "Readme_Visual.txt" )

PATCHES=(
	"${FILESDIR}/${P}-followlinks.patch"
	"${FILESDIR}/${P}-gluegen.patch"
	"${FILESDIR}/${P}-fix-random-runtime-failure.patch"
	"${FILESDIR}/${P}-accessviolation.patch"
	"${FILESDIR}/${P}-missinglib.patch"
	"${FILESDIR}/${P}-batik-1.8.patch"
	"${FILESDIR}/${P}-fop-2.0.patch"
	"${FILESDIR}/${P}-xmlgraphics-common-2.0.patch"
	"${FILESDIR}/${P}-freehep.patch"
)

pkg_pretend() {
	use doc && CHECKREQS_MEMORY="512M" check-reqs_pkg_pretend
}

pkg_setup() {
	if use openmp; then
		if [[ $(tc-getCC) == *gcc* ]] && ! tc-has-openmp; then
			ewarn "You are using a gcc without OpenMP capabilities"
			die "Need an OpenMP capable compiler"
		fi
		FORTRAN_NEED_OPENMP=1
	fi
	FORTRAN_STANDARD="77 90"
	fortran-2_pkg_setup
	#bug 8053
	unset F77
	java-pkg-opt-2_pkg_setup

	ALL_L10N="en_US"
	ALL_L10N_DOC="en_US"
	for l in ${IUSE_L10N}; do
		use l10n_${l} && ALL_L10N="${ALL_L10N} ${l}"
	done
	for l in ${L10N_DOC}; do
		use l10n_${l} && ALL_L10N_DOC="${ALL_L10N_DOC} ${l}"
	done
	export ALL_L10N ALL_L10N_DOC
}

src_prepare() {
	default

	# works for me on x86, but users are having
	# trouble without see #282 on github
	append-ldflags $(no-as-needed)

	# increases java heap to 512M when building docs (sync with cheqreqs above)
	use doc && eapply "${FILESDIR}/${P}-java-heap.patch"

	# use the L10N variable that we set
	sed -i -e "/^ALL_LINGUAS=/d" -e "/^ALL_LINGUAS_DOC=/d" -i configure.ac ||die

	# make sure the DOCBOOK_ROOT variable is set
	sed -i -e "s/xsl-stylesheets-\*/xsl-stylesheets/g" bin/scilab* || die

	# remove self closing <br /> (error our with javadoc8)
	# already upstream commit 2103082c
	find . -name '*.java' -exec sed -i "s|<br />|<BR>|" {} \; ||die

	#add specific gentoo java directories
	if use gui; then
		sed -i -e "s|/usr/lib/jogl2|/usr/lib/jogl-2.2|" \
			-e "s|/usr/lib64/jogl2|/usr/lib64/jogl-2.2|" configure.ac || die
		sed -i -e "s|/usr/lib/gluegen2|/usr/lib/gluegen-2.2|" \
			-e "s|/usr/lib64/gluegen2|/usr/lib64/gluegen-2.2|" \
			-e "s|AC_CHECK_LIB(\[gluegen2-rt|AC_CHECK_LIB([gluegen-rt|" \
			configure.ac || die

		sed -i -e "s/jogl2/jogl-2.2/" -e "s/gluegen2/gluegen-2.2/" \
			etc/librarypath.xml || die
	fi

	mkdir jar || die
	pushd jar >/dev/null
	if use gui; then
		java-pkg_jar-from jlatexmath-1,flexdock,skinlf
		java-pkg_jar-from jgoodies-looks-2.6,jrosetta
		java-pkg_jar-from avalon-framework-4.2,jeuclid-core
		java-pkg_jar-from xmlgraphics-commons-2,commons-io-1
		java-pkg_jar-from jogl-2.2 jogl-all.jar jogl2.jar
		java-pkg_jar-from gluegen-2.2 gluegen-rt.jar gluegen2-rt.jar
		java-pkg_jar-from fop fop.jar
		java-pkg_jar-from javahelp jhall.jar
		java-pkg_jar-from jlatexmath-fop-1
		use xcos &&	java-pkg_jar-from jgraphx-2.5
		if use doc; then
			java-pkg_jar-from --build-only batik-1.8 batik-all.jar
			java-pkg_jar-from --build-only saxon-9 saxon.jar saxon9he.jar
			java-pkg_jar-from --build-only xml-commons-external-1.4 xml-apis-ext.jar
		fi
	fi
	if use emf; then
		java-pkg_jar-from freehep-graphicsio-emf,freehep-graphics2d
		java-pkg_jar-from freehep-graphicsio,freehep-io,freehep-graphicsbase
	fi
	if use test; then
		java-pkg_jar-from junit-4 junit.jar junit4.jar
		java-pkg_jar-from ant-junit
	fi
	popd

	java-pkg-opt-2_src_prepare
	eautoconf
}

src_configure() {
	if use gui; then
		export JAVA_HOME="$(java-config -O)"
	else
		unset JAVAC
	fi

	export BLAS_LIBS="$($(tc-getPKG_CONFIG) --libs blas)"
	export LAPACK_LIBS="$($(tc-getPKG_CONFIG) --libs lapack)"
	export F77_LDFLAGS="${LDFLAGS}"

	econf \
		--enable-relocatable \
		--disable-rpath \
		--with-docbook="${EPREFIX}/usr/share/sgml/docbook/xsl-stylesheets" \
		--disable-static-system-lib \
		$(use_enable debug) \
		$(use_enable debug code-coverage) \
		$(use_enable debug debug-C) \
		$(use_enable debug debug-CXX) \
		$(use_enable debug debug-fortran) \
		$(use_enable debug debug-java) \
		$(use_enable debug debug-linker) \
		$(use_enable doc build-help) \
		$(use_enable nls) \
		$(use_enable nls build-localization) \
		$(use_enable static-libs static) \
		$(use_enable test compilation-tests) \
		$(use_with emf) \
		$(use_with fftw) \
		$(use_with gui) \
		$(use_with gui javasci) \
		$(use_with matio) \
		$(use_with openmp) \
		$(use_with tk) \
		$(use_with umfpack) \
		$(use_with xcos) \
		$(use_with xcos modelica) \
		$(use_with mpi)
}

src_compile() {
	addpredict /proc/mtrr
	default
	pax-mark m .libs/scilab-bin
	use doc && emake doc
}

src_test() {
	if use gui; then
		Xemake check
	else
		emake check
	fi
}

src_install() {
	default
	prune_libtool_files --all
	rm -rf "${D}"/usr/share/scilab/modules/*/tests ||die
	use bash-completion && newbashcomp "${FILESDIR}"/"${PN}".bash_completion "${PN}"
	echo "SEARCH_DIRS_MASK=${EPREFIX}/usr/$(get_libdir)/scilab" \
		> 50-"${PN}"
	insinto /etc/revdep-rebuild && doins "50-${PN}"
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	einfo "If you are using the NVIDIA binary drivers, and run into graphics"
	einfo "crashes, you may try to run scilab as follows:"
	einfo "EGL_DRIVER=egl_glx scilab"
	einfo "See upstream http://bugzilla.scilab.org/show_bug.cgi?id=12940"
}

pkg_postrm() {
	xdg_mimeinfo_database_update
}
