# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="minitest-utils.gemspec"

inherit ruby-fakegem

DESCRIPTION="Some utilities for your Minitest day-to-day usage"
HOMEPAGE="https://github.com/fnando/minitest-utils"
SRC_URI="https://github.com/fnando/minitest-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	sed -i -e '/\(pry\|rubocop\)/ s:^:#:' ${RUBY_FAKEGEM_GEMSPEC} || die
}
