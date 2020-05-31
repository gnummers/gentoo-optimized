# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Common interface for Ruby's HTTP libraries"
HOMEPAGE="https://github.com/savonrb/httpi"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Requires puma for all integration specs
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/rubyntlm )"
