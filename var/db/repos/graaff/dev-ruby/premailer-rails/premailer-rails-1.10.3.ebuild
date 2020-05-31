# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

# rspec3 but requires bundler and thus has dependency complications
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

inherit ruby-fakegem

DESCRIPTION="The power of the premailer gem to Rails without any configuration needs"
HOMEPAGE="https://github.com/fphilipe/premailer-rails"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="1"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionmailer-3:*
	>=dev-ruby/premailer-1.7.9:1
"

ruby_add_bdepend "
	test? ( dev-ruby/nokogiri )
"

all_ruby_prepare() {
	sed -i -e '/if RUBY_ENGINE/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
