# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRA_DOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A class based configuration library"
HOMEPAGE="https://github.com/opscode/mixlib-config"
SRC_URI="https://github.com/opscode/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/tomlrb"

all_ruby_prepare() {
	# Avoid spec failing without bundler
	sed -i -e '/turns TOML into method-style setting/askip "fails without bundler"' spec/mixlib/config_spec.rb || die
}
