# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md README_FROM_VERSION_3_TO_4.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A library for adding finite state machines to Ruby classes."
HOMEPAGE="https://github.com/aasm/aasm"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/concurrent-ruby:1"

ruby_add_bdepend "test? ( dev-ruby/activerecord dev-ruby/rr )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '/coveralls/I s:^:#:' \
		-e '/pry/ s:^:#:' spec/spec_helper.rb || die

	# We currently don't package sdoc
	sed -i -e '/sdoc/d' Rakefile || die

	# Avoid spec that requires unpackaged generator_spec
	rm -f spec/generators/{active_record,mongoid}_generator_spec.rb || die
}
