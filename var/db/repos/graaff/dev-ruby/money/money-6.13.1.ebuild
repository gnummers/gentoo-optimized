# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="money.gemspec"

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="This library aids one in handling money and different currencies."
HOMEPAGE="https://rubymoney.github.io/money/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

ruby_add_rdepend "dev-ruby/i18n:1"

ruby_add_bdepend "doc? ( dev-ruby/yard )"

all_ruby_prepare() {
	sed -i -e '/coveralls/I s:^:#:' spec/spec_helper.rb || die
}
