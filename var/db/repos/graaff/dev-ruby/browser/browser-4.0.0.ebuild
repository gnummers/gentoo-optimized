# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Do some browser detection with Ruby"
HOMEPAGE="https://github.com/fnando/browser"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/\(autotest\|pry\|rubocop\|simplecov\)/ s:^:#:' browser.gemspec || die
	sed -i -e '/rubocop/,/^end/ s:^:#:' Rakefile || die
	sed -i -e '/simplecov/I s:^:#:' test/test_helper.rb || die
}
