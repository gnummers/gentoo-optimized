# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="HTML Tokenizer"
HOMEPAGE="https://rubygems.org/gems/html_tokenizer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/html_tokenizer_ext extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/html_tokenizer_ext V=1
	cp ext/html_tokenizer_ext/html_tokenizer_ext.so lib/ || die
}

each_ruby_test() {
	${RUBY} -Ilib:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
