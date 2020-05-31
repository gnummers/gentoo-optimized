# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="assets config"
RUBY_FAKEGEM_BINDIR="exe"

RUBY_FAKEGEM_GEMSPEC="rubocop.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Ruby static code analyzer"
HOMEPAGE="https://github.com/bbatsov/rubocop"
SRC_URI="https://github.com/bbatsov/rubocop/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/parallel-1.10:1
	>=dev-ruby/parser-2.7.0.1
	>=dev-ruby/rainbow-2.2.2:2
	dev-ruby/rexml
	>=dev-ruby/rubocop-ast-0.0.3
	>=dev-ruby/ruby-progressbar-1.7:0
	>=dev-ruby/unicode-display_width-1.4.0:1"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -e '/pry/ s:^:#:' \
		-i spec/spec_helper.rb || die

	# Remove failing spec for now, passes when run manually
	sed -i -e '/corrects RedundantBegin offenses/askip "fails via portage"' spec/rubocop/cli/cli_autocorrect_spec.rb || die

	sed -i -e 's:/tmp/example:'${TMPDIR}'/example:' spec/rubocop/cop/team_spec.rb || die
}
