# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="ActiveRecord sanitization using Loofah and Nokogiri"
HOMEPAGE="https://github.com/flavorjones/loofah-activerecord"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend ">=dev-ruby/loofah-1.0.0"

ruby_add_bdepend "test? ( dev-ruby/hoe dev-ruby/acts_as_fu )"

all_ruby_prepare() {
	# acts_as_fu is not compatible with later rails versions
	sed -i -e '1igem "rails", "<5.1"' test/helper.rb || die
}
