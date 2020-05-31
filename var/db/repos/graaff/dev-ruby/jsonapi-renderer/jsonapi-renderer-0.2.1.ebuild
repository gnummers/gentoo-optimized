# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Efficiently render JSON API documents"
HOMEPAGE="https://github.com/jsonapi-rb/jsonapi-renderer"
SRC_URI="https://github.com/jsonapi-rb/jsonapi-renderer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#: ; 1irequire "json"' spec/spec_helper.rb || die
}
