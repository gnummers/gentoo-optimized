# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

[[ "${PV}" = *9999* ]] && live=git-r3
inherit ${live} eutils

DESCRIPTION="Slingshot releases rocks! Build framework for Lua"
HOMEPAGE="https://github.com/gvvaughan/slingshot"
if [[ "${PV}" = *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/gvvaughan/${PN}.git"
else
	SRC_URI="https://github.com/gvvaughan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

IUSE="luajit test"

DEPEND="!luajit? ( || ( dev-lang/lua:5.2 dev-lang/lua:5.1 >=dev-lang/lua-5.1:0 ) )
	luajit? ( dev-lang/luajit:2 )
	sys-apps/help2man
	sys-apps/grep
	sys-apps/sed"

DOCS=( "README.md" "NEWS.md" )

src_prepare() {
	epatch "${FILESDIR}/${P}-import-gnulib.patch"

	sed -re 's/\$\(luaexecdir\)/$(DESTDIR)$(luaexecdir)/g' -i Makefile.am || die

	# WARNING: Order matters! Slingshot options are processed first and are ignored otherwise!
	./bootstrap --skip-rock-checks --skip-git --skip-po || die
}

src_configure() {
	local lua=lua
	use luajit && lua=luajit
	econf \
		LUA="${lua}"
}

src_install() {
	default_src_install

	insinto /usr/share/${PN}
	doins -r build-aux m4
	doins .autom4te.cfg GNUmakefile Makefile.am travis.yml.in
}
