# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

[[ "${PV}" = *9999* ]] && live=git-r3
inherit ${live} eutils

DESCRIPTION="Lua bindings for POSIX APIs"
HOMEPAGE="https://github.com/luaposix/luaposix"
if [[ "${PV}" = *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/luaposix/${PN}.git"
else
	SRC_URI="https://github.com/luaposix/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

IUSE="luajit ncurses test unicode"

DEPEND="!luajit? ( || ( dev-lang/lua:5.2 dev-lang/lua:5.1 >=dev-lang/lua-5.1:0 ) )
	luajit? ( dev-lang/luajit:2 )"
RDEPEND="${DEPEND}
	!luajit? ( || ( dev-lang/lua:5.2 dev-lua/LuaBitOp ) )"
DEPEND="${DEPEND}
	>=dev-lua/ldoc-1.4.2
	dev-lua/slingshot
	sys-apps/help2man
	dev-lang/perl"

DOCS=( "README.md" "NEWS.md" )

src_prepare() {
	epatch "${FILESDIR}/${P}-remove-gnulib.patch"

	rmdir slingshot || die
	ln -s "${EPREFIX}"/usr/share/slingshot . || die

	# WARNING: Order matters! Slingshot options are processed first and are ignored otherwise!
	./bootstrap --skip-rock-checks --skip-git --skip-po || die
}

src_configure() {
	local lua=lua
	use luajit && lua=luajit

	econf \
		LUA="${lua}" \
		$(use_with ncurses) \
		$(use_with unicode ncursesw)
}

src_compile() {
	emake -j1
}
