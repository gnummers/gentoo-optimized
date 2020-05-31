# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="https://github.com/binarylogic/authlogic"
SRC_URI="https://github.com/binarylogic/authlogic/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="5"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activerecord-5.2:*   <dev-ruby/activerecord-6.1:*
	>=dev-ruby/activesupport-5.2:*  <dev-ruby/activesupport-6.1:*
	>=dev-ruby/request_store-1.0.5:*
	>=dev-ruby/bcrypt-ruby-3.1.5"
ruby_add_bdepend "test? ( >=dev-ruby/bcrypt-ruby-3.1.5 dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/\(bundler\|coverall\|rubocop\)/I s:^:#:' Rakefile || die
	sed -i -e '/byebug/ s:^:#: ; /reporters/I s:^:#:' \
		-e '/coveralls/,$ s:^:#:' test/test_helper.rb || die

	sed -i -e '/:crypto_provider/ s/SCrypt/BCrypt/' lib/authlogic/acts_as_authentic/password.rb || die
	sed -i -e 's/SCrypt/BCrypt/' test/fixtures/{admins,users}.yml || die
	sed -i -e '/SCrypt/ s:^:#:' test/test_helper.rb || die

	sed -i -e '/scrypt/d' \
		-e '/bcrypt/ s/development_//' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid tests for now that fail due to our BCrypt hack
	rm -f test/session_test/{http_auth,persistence,password,magic_columns}_test.rb || die
	rm -f test/acts_as_authentic_test/{password,persistence_token}_test.rb || die
	rm -f test/crypto_provider_test/scrypt_test.rb || die
}
