# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_BINDIR="exe"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="erb_lint.gemspec"

inherit ruby-fakegem

DESCRIPTION="ERB Linter tool"
HOMEPAGE="https://github.com/Shopify/erb-lint"
SRC_URI="https://github.com/Shopify/erb-lint/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="erb-lint-${PV}"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/activesupport:*
	>=dev-ruby/better_html-1.0.7:1
	dev-ruby/html_tokenizer
	dev-ruby/rainbow:*
	>=dev-ruby/rubocop-0.51
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/fakefs )"
