# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST="-Ilib test features"

inherit ruby-fakegem

DESCRIPTION="A Rails adapter for the Compass Stylesheet Authoring Framework"
HOMEPAGE="http://compass-style.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Uses appraisal and rainbow and runs integration on a variety of Rails
# versions.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/compass:1 <dev-ruby/sprockets-4.0:* <dev-ruby/sass-rails-5.1:*"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/ s:^:#:' Rakefile || die
}
