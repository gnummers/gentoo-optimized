# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Captures stdout, stderr and (optionally) stdin; uses PTY to avoid buffering"
HOMEPAGE="https://github.com/xeger/backticks"
SRC_URI="https://github.com/xeger/backticks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' -e '/coverall/I s:^:#:' spec/spec_helper.rb || die
}
