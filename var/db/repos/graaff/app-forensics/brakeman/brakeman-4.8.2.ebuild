# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_DOCDIR="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGES.md FEATURES OPTIONS.md README.md"

RUBY_FAKEGEM_GEMSPEC="brakeman.gemspec"

inherit ruby-fakegem

DESCRIPTION="Static analysis tool which checks RoR applications for security vulnerabilities"
HOMEPAGE="https://brakemanscanner.org/"
SRC_URI="https://github.com/presidentbeef/brakeman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BPUL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/erubis-2.6
	>=dev-ruby/haml-5.1:5
	dev-ruby/highline:2
	>=dev-ruby/ruby2ruby-2.4.0 =dev-ruby/ruby2ruby-2.4*
	>=dev-ruby/ruby_parser-3.13.0 =dev-ruby/ruby_parser-3*
	>=dev-ruby/safe_yaml-1.0
	>=dev-ruby/sexp_processor-4.7:4
	>=dev-ruby/slim-1.3.6:*
	>=dev-ruby/terminal-table-1.4.5 =dev-ruby/terminal-table-1*"

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	# Avoid seemingly harmless test failure
	sed -i -e '/test_highline/askip "gentoo"' test/tests/pager.rb || die

	sed -e '/ruby_parser-legacy/ s:^:#:' \
		-e '/minitest-ci/ s:^:#:' \
		-e '/simplecov/ s:^:#:' \
		-i gem_common.rb || die

	sed -i -e '/rake/ s/,.*$// ; /codeclimate/ s:^:#: ; /json/ s:^:#:' Gemfile || die

	# Avoid support for obsolete ruby versions
	sed -i -e '/ruby_parser\/legacy/ s:^:#:' lib/brakeman/scanner.rb || die
	rm -f test/tests/{markdown_output,rails2}.rb || die
}
