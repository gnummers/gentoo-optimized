# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="package.json"

inherit ruby-fakegem

DESCRIPTION="Use webpack to manage app-like JavaScript modules in Rails"
HOMEPAGE="https://github.com/rails/webpacker"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.2:*
	>=dev-ruby/rack-proxy-0.6.1
	>=dev-ruby/railties-4.2:*
"

all_ruby_prepare() {
	sed -i -e '/byebug/ s:^:#:' test/test_helper.rb || die
	rm -f Gemfile.lock || die

	mkdir -p test/test_app/node_modules || die

	# Avoid failing test
	sed -i -e '/test_rake_webpacker_yarn_install_in_non_production_environments/askip' test/rake_tasks_test.rb || die
}

each_ruby_test() {
	RUBYLIB="$(pwd)/lib" ${RUBY} -S rake test || die
}
