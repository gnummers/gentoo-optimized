# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_EXTRAINSTALL="db"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Advanced tagging for Rails."
HOMEPAGE="https://github.com/mbleigh/acts-as-taggable-on/"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/activerecord-5*:*"

ruby_add_bdepend "test? (
	dev-ruby/database_cleaner
	dev-ruby/rspec-its
	)"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die

	# Provide a database.yml file for sqlite3.
	cp spec/internal/config/database.yml.sample spec/internal/config/database.yml || die
	sed -i -e '/^mysql/,$d' spec/internal/config/database.yml || die

	sed -i -e '/barrier/ s:^:#:' spec/spec_helper.rb || die

	# Avoid deprecation warning which cannot be solved due to issues with default_parser.
	sed -i -e '/WARNING/,/WARNING/ s:^:#:' lib/acts-as-taggable-on.rb || die
}
