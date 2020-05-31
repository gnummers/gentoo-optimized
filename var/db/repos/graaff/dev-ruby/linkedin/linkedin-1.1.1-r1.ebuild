# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md EXAMPLES.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

COMMIT=b6b269d2ee6016122b93751c1046f5eee7b74367

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for the LinkedIn API"
HOMEPAGE="https://github.com/hexgnu/linkedin"
# Experimental pull request with v2 support
SRC_URI="https://github.com/dsandstrom/linkedin/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

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
