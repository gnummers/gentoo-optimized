# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="An Action Dispatch session store backed by an Active Record class"
HOMEPAGE="https://github.com/rails/activerecord-session_store"
SRC_URI="https://github.com/rails/activerecord-session_store/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/bundler dev-ruby/sqlite3 )"

ruby_add_rdepend "
	>=dev-ruby/actionpack-4.0:*
	>=dev-ruby/activerecord-4.0:*
	>=dev-ruby/multi_json-1.11.2:0
	|| ( dev-ruby/rack:2.0 dev-ruby/rack:1.6 )
	>=dev-ruby/railties-4.0:*
"

all_ruby_prepare() {
	sed -i -e '/appraisal/ s:^:#:' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} -S bundle exec rake test || die
}
