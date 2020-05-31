# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="recaptcha.gemspec"

inherit ruby-fakegem

DESCRIPTION="Adds helpers for the reCAPTCHA API"
HOMEPAGE="https://github.com/ambethia/recaptcha"
SRC_URI="https://github.com/ambethia/recaptcha/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="4"
IUSE="test"

ruby_add_rdepend "dev-ruby/json:*"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/mocha
	dev-ruby/activesupport
	dev-ruby/i18n
	dev-ruby/minitest:5
	dev-ruby/webmock
)"

all_ruby_prepare() {
	sed -i -e '/bump/ s:^:#:' Rakefile test/helper.rb || die
	sed -i -e '/\(bump\|pry\)/ s:^:#:' ${RUBY_FAKEGEM_GEMSPEC} || die
	rm -f Gemfile.lock || die
}
