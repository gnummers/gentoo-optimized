# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Better HTML for Rails"
HOMEPAGE="https://github.com/Shopify/better-html"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/actionview-4.2:*
	>=dev-ruby/activesupport-4.2:*
	dev-ruby/ast:0
	dev-ruby/erubi:0
	dev-ruby/html_tokenizer
	>=dev-ruby/parser-2.4
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/mocha )"

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
