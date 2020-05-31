# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="Changes.md README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="a Gem to help you manage your Rails API endpoints"
HOMEPAGE="https://github.com/EDMC/api-versions"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

# Needs a specific old version of ammeter that is no longer available
# for us.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/actionpack-3.0:* >=dev-ruby/activesupport-3.0:*"

ruby_add_bdepend "test? ( dev-ruby/rspec-rails dev-ruby/ammeter )"
