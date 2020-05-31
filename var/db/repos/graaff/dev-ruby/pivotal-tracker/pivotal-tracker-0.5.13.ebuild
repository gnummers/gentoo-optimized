# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Ruby gem that provides an AR-style interface for the Pivotal Tracker API."
HOMEPAGE="https://github.com/jsmestad/pivotal-tracker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test" # stale_fish does not work with activesupport 4.2.

# ruby_add_bdepend "test? ( >=dev-ruby/stale_fish-1.3.0 )"

ruby_add_rdepend ">=dev-ruby/rest-client-1.8.0:*
	>=dev-ruby/nokogiri-1.5.5
	>=dev-ruby/nokogiri-happymapper-0.5.4
	dev-ruby/crack
	dev-ruby/builder:*"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' spec/spec_helper.rb || die
}
