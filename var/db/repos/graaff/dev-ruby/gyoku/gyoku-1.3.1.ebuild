# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Translates Ruby Hashes to XML"
HOMEPAGE="https://github.com/savonrb/gyoku"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-2.1.2:*"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^  end/ s:^:#:' \
		-e '/bundler/I s:^:#:' spec/spec_helper.rb || die
}
