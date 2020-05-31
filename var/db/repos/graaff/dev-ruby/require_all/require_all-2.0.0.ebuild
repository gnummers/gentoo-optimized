# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

inherit ruby-fakegem

DESCRIPTION="A wonderfully simple way to load your code"
HOMEPAGE="https://github.com/jarmo/require_all"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

all_ruby_prepare() {
	sed -i '/cov/I s:^:#: ; 1irequire "fileutils"' spec/spec_helper.rb || die
}
