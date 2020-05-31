# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_GEMSPEC="zendesk_api.gemspec"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the REST API at https://www.zendesk.com"
HOMEPAGE="https://github.com/zendesk/zendesk_api_client_rb/"
SRC_URI="https://github.com/zendesk/zendesk_api_client_rb/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="zendesk_api_client_rb-${PV}"

LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/faraday-0.9:0
	>=dev-ruby/hashie-3.5.3:3
	dev-ruby/inflection
	=dev-ruby/multipart-post-2*
	dev-ruby/mime-types:*
"

all_ruby_prepare() {
	# Avoid live specs that require a network and credentials
	rm -rf spec/live || die
}
