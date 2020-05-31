# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

inherit ruby-fakegem

DESCRIPTION="A wonderfully simple way to load your code"
HOMEPAGE="https://github.com/jarmo/require_all"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -i '/cov/I s:^:#:' spec/spec_helper.rb || die
}
