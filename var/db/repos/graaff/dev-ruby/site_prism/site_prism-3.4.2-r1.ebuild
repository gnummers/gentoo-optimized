# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="HACKING.md README.md UPGRADING.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="site_prism.gemspec"

inherit ruby-fakegem

DESCRIPTION="A simple, clean and semantic DSL for describing your site with Page Object Model"
HOMEPAGE="https://github.com/site-prism/site_prism"
SRC_URI="https://github.com/site-prism/site_prism/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE="doc"

ruby_add_rdepend "
	>=dev-ruby/addressable-2.5:0
	>=dev-ruby/capybara-3.3:3
	>=dev-ruby/site_prism-all_there-0.3.1:0
"

all_ruby_prepare() {
	# Version does not get autoloaded.
	sed -i -e '3irequire "site_prism/version"' spec/site_prism/version_spec.rb || die

	# Fix version number in gemspec
	sed -i -e 's/3.4.1/'${PV}'/' lib/site_prism/version.rb || die
}
