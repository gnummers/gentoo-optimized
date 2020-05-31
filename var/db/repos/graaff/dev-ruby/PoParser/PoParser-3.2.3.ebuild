# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A PO file parser, editor and generator"
HOMEPAGE="https://github.com/arashm/poparser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/simple_po_parser-1.1.2 =dev-ruby/simple_po_parser-1.1*"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#: ; 1irequire "pathname"' spec/spec_helper.rb || die
}
