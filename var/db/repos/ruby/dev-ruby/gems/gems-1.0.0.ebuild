# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the RubyGems.org API"
HOMEPAGE="https://github.com/rubygems/gems"
SRC_URI="https://github.com/rubygems/gems/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#:' spec/helper.rb || die
}
