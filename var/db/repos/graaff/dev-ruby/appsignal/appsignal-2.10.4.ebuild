# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md SUPPORT.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="ext resources"

inherit ruby-fakegem

DESCRIPTION="The official appsignal.com gem"
HOMEPAGE="https://docs.appsignal.com/ruby/"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/rack:*
"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/timecop
	dev-ruby/webmock
)"

all_ruby_prepare() {
	sed -i -e '/rake/ s/~>/>=/' -e '/\("rubocop\|pry\)/ s:^:#:' appsignal.gemspec || die
	sed -i -e '/pry/ s:^:#:' spec/spec_helper.rb || die
}

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext
}

each_ruby_test() {
	${RUBY} -S bundle exec rspec-3 spec || die
}
