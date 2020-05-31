# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="a recurring date library for Ruby"
HOMEPAGE="http://seejohncode.com/ice_cube/"
SRC_URI="https://github.com/seejohnrun/ice_cube/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activesupport dev-ruby/i18n dev-ruby/tzinfo )"

all_ruby_prepare() {
	sed -i -e 's/@example/example/' spec/spec_helper.rb || die
	rm -r .rspec || die
}

each_ruby_test() {
	TZ=utc RSPEC_VERSION=3 ruby-ng_rspec || die
}
