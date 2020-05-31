# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="data"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Ruby SDK for Microsoft Graph"
HOMEPAGE="https://graph.microsoft.io/ https://github.com/microsoftgraph/msgraph-sdk-ruby/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

# Tests are not included in the gem and upstream does not tag releases.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/nokogiri-1.8.0:0
"

all_ruby_prepare() {
	sed -i -e '/nokogiri/ s/1.8.0/1.8/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
