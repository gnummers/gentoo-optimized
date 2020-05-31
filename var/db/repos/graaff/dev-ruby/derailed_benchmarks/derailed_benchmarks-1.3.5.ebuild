# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Go faster, off the Rails"
HOMEPAGE="https://github.com/schneems/derailed_benchmarks"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Requires devise which is not packaged.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/benchmark-ips-2
	dev-ruby/get_process_mem
	dev-ruby/heapy
	dev-ruby/memory_profiler
	>=dev-ruby/rack-1:*
	>=dev-ruby/rake-10
	>=dev-ruby/thor-0.19:0
"

all_ruby_prepare() {
	rm -f Gemfile.lock || die
}
