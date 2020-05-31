# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit python-single-r1 git-r3

DESCRIPTION="Makes debugging with GDB suck less"
HOMEPAGE="https://github.com/pwndbg/pwndbg"
EGIT_REPO_URI="https://github.com/pwndbg/pwndbg.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-devel/gdb[python]
		dev-python/future
		dev-python/isort
		dev-python/pyelftools
		~dev-libs/capstone-4.0.1[python]
		app-misc/ROPgadget
		dev-python/pip
		dev-python/pygments
		>=dev-python/psutil-3.1.0
		>=dev-libs/unicorn-bindings-1.0.0[python]
		dev-python/pycparser
		dev-python/six
		dev-python/pytest"

src_prepare() {
	sed '/0L/d' -i ida_script.py
	eapply_user
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r *.py pwndbg
	insinto "/usr/share/doc/${PF}"
	doins *.md
}

pkg_postinst() {
	readme.gentoo_print_elog

	elog "To use ${PN} you have to add this to your ~/.gdbinit"
	elog "source /usr/share/${PN}/gdbinit.py"
	elog "You can simply execute:"
	elog "echo \"source /usr/share/${PN}/gdbinit.py\" >> ~/.gdbinit"
}
