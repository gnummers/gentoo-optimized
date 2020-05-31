# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A templating system for URIs"
HOMEPAGE="https://github.com/hannesg/uri_template"
SRC_URI="https://github.com/hannesg/uri_template/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

# Test files are included using a submodule
RESTRICT="test"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' spec/helper.rb || die
}
