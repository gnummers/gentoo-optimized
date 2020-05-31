# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

#RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Windows Azure Active Directory authentication client library"
HOMEPAGE="https://github.com/AzureAD/azure-activedirectory-library-for-ruby"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"

# Some tests fail, most likely due to requiring an old webmock version
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/jwt-1.5:0
	>=dev-ruby/nokogiri-1.6:0
	>=dev-ruby/uri_template-0.7
"

ruby_add_bdepend "test? (
	dev-ruby/webmock
)"
