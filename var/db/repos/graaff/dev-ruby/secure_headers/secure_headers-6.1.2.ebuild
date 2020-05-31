# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Security related headers all in one gem"
HOMEPAGE="https://github.com/twitter/secureheaders"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="6"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' \
		-e '/coverall/I s:^:#:' \
		-e '1irequire "securerandom"; require "uri"; require "json"; require "digest"' \
		spec/spec_helper.rb || die
}
