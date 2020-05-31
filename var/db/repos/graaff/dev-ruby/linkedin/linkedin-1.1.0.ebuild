# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md EXAMPLES.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for the LinkedIn API"
HOMEPAGE="https://github.com/hexgnu/linkedin"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

# Specs use vcr which is no longer packaged.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/hashie-3.0 =dev-ruby/hashie-3*
	dev-ruby/multi_json:0
	>=dev-ruby/oauth-0.4
"
