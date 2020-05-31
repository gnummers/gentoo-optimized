# Copyright 1999-2020 Martin V\"ath and others
# Distributed under the terms of the GNU General Public License v2

EAPI=7
WANT_LIBTOOL=none
AUTOTOOLS_AUTO_DEPEND=no
MESON_AUTO_DEPEND=no
inherit autotools bash-completion-r1 meson tmpfiles

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
case ${PV} in
99999999*)
	EGIT_REPO_URI="https://github.com/vaeth/${PN}.git"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
	PROPERTIES="live";;
*)
	RESTRICT="mirror"
	EGIT_COMMIT="6707bc479ca05aa7289ce2c9de6e5ca8e753d1d6"
	SRC_URI="https://github.com/vaeth/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}";;
esac

DESCRIPTION="Search and query ebuilds"
HOMEPAGE="https://github.com/vaeth/eix/"

LICENSE="GPL-2"
SLOT="0"
PLOCALES="de ru"
IUSE="debug +dep doc +jumbo-build"
for i in ${PLOCALES}; do
	IUSE+=" l10n_${i}"
done
IUSE+=" +meson nls optimization protobuf +required-use security +src-uri strong-optimization strong-security sqlite swap-remote tools usr-portage"

DEPEND="nls? ( virtual/libintl )
	sqlite? ( >=dev-db/sqlite-3:= )"
RDEPEND="${DEPEND}
	>=app-shells/push-3.1
	>=app-shells/quoter-4.1"
BDEPEND="meson? (
		>=dev-util/meson-0.41.0
		>=dev-util/ninja-1.7.2
		strong-optimization? ( >=sys-devel/gcc-config-1.9.1 )
		nls? ( sys-devel/gettext )
	)
	!meson? ( ${AUTOTOOLS_DEPEND} >=sys-devel/gettext-0.19.6 )
	protobuf? ( dev-libs/protobuf )"

pkg_setup() {
	# remove stale cache file to prevent collisions
	local old_cache="${EROOT}var/cache/${PN}"
	test -f "${old_cache}" && rm -f -- "${old_cache}"
}

src_prepare() {
	sed -i -e "s'/'${EPREFIX}/'" -- "${S}"/tmpfiles.d/eix.conf || die
	default
	use meson || {
		eautopoint
		eautoreconf
	}
}

src_configure() {
	local i
	export LINGUAS=
	for i in ${PLOCALES}; do
		use l10n_${i} && LINGUAS+=${LINGUAS:+ }${i}
	done
	if use meson; then
		local emesonargs=(
		-Ddocdir="${EPREFIX}/usr/share/doc/${P}"
		-Dhtmldir="${EPREFIX}/usr/share/doc/${P}/html"
		$(meson_use jumbo-build)
		$(meson_use sqlite)
		$(meson_use protobuf)
		$(meson_use doc extra-doc)
		$(meson_use nls)
		$(meson_use tools separate-tools)
		$(meson_use security)
		$(meson_use optimization normal-optimization)
		$(meson_use strong-security)
		$(meson_use strong-optimization)
		$(meson_use debug debugging)
		$(meson_use swap-remote)
		$(meson_use prefix always-accept-keywords)
		$(meson_use dep dep-default)
		$(meson_use required-use required-use-default)
		$(meson_use src-uri src-uri-default)
		$(usex usr-portage -Dportdir-default=/usr/portage '')
		-Dzsh-completion="${EPREFIX}/usr/share/zsh/site-functions"
		-Dportage-rootpath="${ROOTPATH}"
		-Deprefix-default="${EPREFIX}"
		)
		if use prefix; then
			emesonarge+=(
				-Deix-user=
				-Deix-uid=-1
			)
		fi
		meson_src_configure
	else
		local myconf=(
		$(use_enable jumbo-build)
		$(use_with sqlite)
		$(use_with protobuf)
		$(use_with doc extra-doc)
		$(use_enable nls)
		$(use_enable tools separate-tools)
		$(use_enable security)
		$(use_enable optimization)
		$(use_enable strong-security)
		$(use_enable strong-optimization)
		$(use_enable debug debugging)
		$(use_enable swap-remote)
		$(use_with prefix always-accept-keywords)
		$(use_with dep dep-default)
		$(use_with required-use required-use-default)
		$(use_with src-uri src-uri-default)
		$(use_with usr-portage portdir-default /usr/portage)
		--with-zsh-completion
		--with-portage-rootpath="${ROOTPATH}"
		--with-eprefix-default="${EPREFIX}"
		)
		if use prefix; then
			myconf+=(
				--with-eix-user=
				--with-eix-uid=-1
			)
		fi
		econf "${myconf[@]}"
	fi
}

src_compile() {
	if use meson; then
		meson_src_compile
	else
		default
	fi
}

src_test() {
	if use meson; then
		meson_src_test
	else
		default
	fi
}

src_install() {
	if use meson; then
		meson_src_install
	else
		default
	fi
	dobashcomp bash/eix
	dotmpfiles tmpfiles.d/eix.conf
	use doc && dodoc src/output/eix.proto
}

pkg_postinst() {
	local obs="${EROOT}var/cache/eix.previous"
	if test -f "${obs}"; then
		ewarn "Found obsolete ${obs}, please remove it"
	fi
	tmpfiles_process eix.conf
}

pkg_postrm() {
	if [ -z "${REPLACED_BY_VERSION}" ]; then
		rm -rf -- "${EROOT}var/cache/${PN}"
	fi
}
