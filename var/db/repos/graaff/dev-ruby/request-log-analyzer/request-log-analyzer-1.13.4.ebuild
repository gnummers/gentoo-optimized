# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="DESIGN.rdoc README.rdoc"

RUBY_FAKEGEM_BINWRAP="request-log-analyzer"

inherit ruby-fakegem

DESCRIPTION="This is a simple command line tool to analyze request log files."
HOMEPAGE="https://github.com/wvanbergen/request-log-analyzer/wiki"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activerecord[sqlite] )"

all_ruby_prepare() {
	rm Gemfile || die

	# Drop specs that require a running database
	rm -f spec/unit/aggregator/database_inserter_spec.rb \
		spec/unit/database/database_spec.rb || die
}
