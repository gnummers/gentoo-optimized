# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Easy upload management for ActiveRecord"
HOMEPAGE="https://github.com/thoughtbot/paperclip"
#SRC_URI="https://github.com/gshutler/useragent/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="5"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activemodel-4.2.0:*
	>=dev-ruby/activesupport-4.2.0:*
	>=dev-ruby/mimemagic-0.3.0:0
	dev-ruby/mime-types
	=dev-ruby/terrapin-0.6*
"

ruby_add_bdepend "test? ( dev-ruby/bourne )"

all_ruby_prepare() {
	# Remove specs for unpackaged dependencies
	rm -f spec/paperclip/storage/{fog,s3_live,s3}_spec.rb || die
	rm -f spec/paperclip/integration_spec.rb || die
	sed -i -e '/activerecord-import/ s:^:#:' spec/spec_helper.rb || die
}
