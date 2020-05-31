# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides recurrence to icalendar gem"
HOMEPAGE="https://github.com/icalendar/icalendar-recurrence"
LICENSE="|| ( GPL-2 BSD Ruby )"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "dev-ruby/icalendar:2 >=dev-ruby/ice_cube-0.16"

all_ruby_prepare() {
	sed -i -e '/\(awesome\|pry\)/ s:^:#:' spec/spec_helper.rb || die

	# Avoid output on STDOUT for warnings
	# https://github.com/icalendar/icalendar-recurrence/issues/13
	sed -i -e '58 s/warn/#warn/' lib/icalendar/recurrence/schedule.rb || die
}
