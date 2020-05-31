# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="jaro_winkler.gemspec"

inherit ruby-fakegem

DESCRIPTION="Implementation of Jaro-Winkler distance algorithm"
HOMEPAGE="https://github.com/tonytonyjan/jaro_winkler"
SRC_URI="https://github.com/tonytonyjan/jaro_winkler/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="1"

each_ruby_configure() {
	${RUBY} -C ext/jaro_winkler extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/jaro_winkler
	cp ext/jaro_winkler/jaro_winkler_ext.so lib/jaro_winkler/ || die
}

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*"].each{ |f| require f }' || die
}
