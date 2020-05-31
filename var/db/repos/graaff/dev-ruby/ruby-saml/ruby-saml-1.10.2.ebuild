# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="https://github.com/onelogin/ruby-saml"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.8"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.8.2"

ruby_add_bdepend "test? ( dev-ruby/timecop dev-ruby/mocha dev-ruby/shoulda:0 )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' \
		-e '/bundler/I s:^:#:' \
		-e '/simplecov/ s:^:#:' \
		-e '/SimpleCov/,/^end/ s:^:#:' test/test_helper.rb || die

	sed -ie -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '2i gem "shoulda", "~> 2.11"' test/test_helper.rb || die

	sed -i -e '3irequire "onelogin/ruby-saml/http_error"' test/idp_metadata_parser_test.rb || die
}
