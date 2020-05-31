# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md EXAMPLES.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for the LinkedIn API"
HOMEPAGE="https://github.com/hexgnu/linkedin"

LICENSE="MIT"
SLOT="1.1.1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/hashie-3.0 =dev-ruby/hashie-3*
	dev-ruby/multi_json:0
	=dev-ruby/oauth2-1*
"

ruby_add_bdepend "test? ( dev-ruby/vcr:3 )"
