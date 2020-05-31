# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="A wonderfully simple way to load your code"
HOMEPAGE="https://github.com/jarmo/require_all"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

all_ruby_prepare() {
	sed -i '/cov/I s:^:#: ; 1irequire "fileutils"' spec/spec_helper.rb || die
}
