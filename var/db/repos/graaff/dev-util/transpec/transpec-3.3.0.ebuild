# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

# specs require old versions of rspec and rake
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="converts your specs to the latest RSpec syntax with static and dynamic code analysis"
HOMEPAGE="http://yujinakayama.me/transpec/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-3.0:*
	>=dev-ruby/astrolabe-1.2:0
	>=dev-ruby/bundler-1.3:0
	dev-ruby/json:2
	>=dev-ruby/parser-2.3.0.7
	dev-ruby/rainbow:2
"
