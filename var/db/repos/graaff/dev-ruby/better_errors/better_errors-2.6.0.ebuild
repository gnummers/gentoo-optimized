# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Provides a better error page for Rails and other Rack apps"
HOMEPAGE="https://github.com/BetterErrors/better_errors"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

# Uses various gemfiles
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/coderay-1.0.0
	>=dev-ruby/erubi-1.0.0
	>=dev-ruby/rack-0.9.0
"
