# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Parse XML data and convert it quickly and easily into ruby data structures"
HOMEPAGE="https://rubygems.org/gems/nokogiri-happymapper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
