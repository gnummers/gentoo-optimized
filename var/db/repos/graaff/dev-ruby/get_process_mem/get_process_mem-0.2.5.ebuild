# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Get memory usage of a process in Ruby"
HOMEPAGE="https://github.com/schneems/get_process_mem"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' test/test_helper.rb || die
}
