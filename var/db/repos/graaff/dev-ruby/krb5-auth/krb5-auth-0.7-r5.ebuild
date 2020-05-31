# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README TODO example.rb"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="ext"

inherit multilib ruby-fakegem

DESCRIPTION="Ruby bindings for the Kerberos library"
HOMEPAGE="http://rubyforge.org/projects/krb5-auth/"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

DEPEND="${DEPEND} virtual/krb5"
RDEPEND="${RDEPEND} virtual/krb5"

RUBY_PATCHES=( ${P}-ruby19.patch )

all_ruby_prepare() {
	# Move the example out of the bin directory to avoid auto-installation
	mv bin/example.rb . || die
	rmdir bin || die
}

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	# We have injected --no-undefined in Ruby as a safety precaution
	# against broken ebuilds, but these bindings unfortunately rely on
	# a symbol that cannot be linked directly.
	find . -name Makefile -print0 | xargs -0 \
		sed -i -e 's:-Wl,--no-undefined::' || die "--no-undefined removal failed"

	emake V=1 -Cext || die
}

all_ruby_install() {
	all_fakegem_install

	dodoc example.rb
}
