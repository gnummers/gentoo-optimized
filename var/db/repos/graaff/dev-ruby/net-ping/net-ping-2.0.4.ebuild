# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md doc/ping.txt"

inherit ruby-fakegem

DESCRIPTION="Provides a ping interface for Ruby"
HOMEPAGE="https://github.com/chernesk/net-ping"
LICENSE="Artistic-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/fakeweb )"

all_ruby_prepare() {
	# Avoid tests requiring specific network access and setup
	rm -f test/test_net_ping_external.rb || die
	sed -i -e '/external/ s:^:#:' test/test_net_ping.rb || die
	sed -i -e '/ping fails if timeout exceeded/aomit "network"' test/test_net_ping_http.rb || die
	sed -i -e '/test_exception/aomit "network"' test/test_net_ping_tcp.rb || die
}
