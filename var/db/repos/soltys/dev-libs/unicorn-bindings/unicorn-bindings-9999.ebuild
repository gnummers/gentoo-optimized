# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV=${PV/_/-}

PYTHON_COMPAT=( python{2_7,3_{4,5,6,7}} )
inherit multilib distutils-r1 git-r3

DESCRIPTION="Unicorn bindings"
HOMEPAGE="http://www.unicorn-engine.org"
EGIT_REPO_URI="https://github.com/unicorn-engine/unicorn.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+python"

RDEPEND="~dev-util/unicorn-${PV}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	"
#	go? ( dev-lang/go )
#	ruby? ( dev-lang/ruby:* )

S="${WORKDIR}/unicorn-bindings-${MY_PV}"/bindings

pkg_setup() {
	python_setup
}

src_prepare(){
	#do not compile C extensions
	export LIBUNICORN_PATH=1

#	use go || sed -i -e '/go gen_const/d' Makefile
#	use java || sed -i -e '/java gen_const/d' Makefile
#	use python || sed -i -e '/python gen_const/d' Makefile
#	use ruby || sed -i -e '/ruby gen_const/d' Makefile

	sed -i -e '/const_generator.py dotnet/d' Makefile
	#fix python2 install
	sed -i "s|python setup.py install|python2 setup.py install|" python/Makefile || die
	eapply_user
}

src_compile(){
	einfo "Nothing to compile"
}

src_install(){
	if use python; then
		myinstall_python() {
			if python_is_python3; then
				emake -C python DESTDIR="${D}" install3
			else
				emake -C python DESTDIR="${D}" install
			fi
			python_optimize
		}
		python_foreach_impl myinstall_python
	fi
}
