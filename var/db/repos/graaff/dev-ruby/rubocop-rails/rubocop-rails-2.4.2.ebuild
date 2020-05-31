# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-rails.gemspec"

inherit ruby-fakegem

DESCRIPTION="A collection of RuboCop cops to check for performance optimizations in Ruby code"
HOMEPAGE="https://github.com/rubocop-hq/rubocop-rails/"
SRC_URI="https://github.com/rubocop-hq/rubocop-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rack-1.1:*
	>=dev-ruby/rubocop-0.72.0
"
