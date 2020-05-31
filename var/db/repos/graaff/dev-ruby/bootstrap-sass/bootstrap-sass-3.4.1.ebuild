# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="assets"

inherit ruby-fakegem

DESCRIPTION="Sass-powered version of Bootstrap 3"
HOMEPAGE="https://github.com/twbs/bootstrap-sass"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="3.4"
IUSE=""

# Requires bundler setup for rails project to test with
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/autoprefixer-rails-5.2.1:*
	>=dev-ruby/sassc-2.0.0
"

all_ruby_prepare() {
	sed -i -e '/reporters/I s:^:#:' \
		-e '/bundler/ s:^:#:' test/test_helper.rb || die
}
