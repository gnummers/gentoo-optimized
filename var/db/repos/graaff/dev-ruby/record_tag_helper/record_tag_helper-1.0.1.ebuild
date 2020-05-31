# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="record_tag_helper.gemspec"

inherit ruby-fakegem

DESCRIPTION="ActionView Record Tag Helpers"
HOMEPAGE="https://github.com/rails/record_tag_helper"
SRC_URI="https://github.com/rails/record_tag_helper/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

#RESTRICT="test"

ruby_add_rdepend "
	=dev-ruby/actionview-5*:*
"

ruby_add_bdepend "test? (
	=dev-ruby/actionpack-5*
	=dev-ruby/activemodel-5*
	>=dev-ruby/mocha-1.1.0:1.0
)"

all_ruby_prepare() {
	rm -f Gemfile.lock || die
	sed -i -e '/rake/ s/~>/>=/' \
		-e '/mocha/ s/1.1.0/1.1/' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/bundler/ s:^:#:' test/test_helper.rb || die
}
