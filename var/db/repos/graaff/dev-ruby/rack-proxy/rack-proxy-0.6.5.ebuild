# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Rack app providing request/response rewriting proxy capabilities with streaming"
HOMEPAGE="https://github.com/ncr/rack-proxy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# All tests work against live services
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/rack:*
"
