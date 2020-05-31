# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="rubocop-ast.gemspec"

inherit ruby-fakegem

DESCRIPTION="RuboCop's Node and NodePattern classes"
HOMEPAGE="https://github.com/rubocop-hq/rubocop-ast"
SRC_URI="https://github.com/rubocop-hq/rubocop-ast/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/parser-2.7.0.1
"

all_ruby_prepare() {
	sed -i -e '3irequire "uri"' spec/spec_helper.rb || die
}
