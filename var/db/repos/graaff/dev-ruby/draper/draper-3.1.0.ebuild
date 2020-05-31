# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="View Models for Rails"
HOMEPAGE="https://github.com/drapergem/draper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="3"
IUSE="test"

# Uses unpackaged dependencies and it not easy to isolate.
RESTRICT="test"

ruby_add_rdepend "
	=dev-ruby/actionpack-5*:*
	=dev-ruby/activemodel-5*:*
	dev-ruby/activemodel-serializers-xml:1.0
	=dev-ruby/activesupport-5*:*
	>=dev-ruby/request_store-1.0.3:0"

# ammeter is only needed for generator specs which we skip
#ruby_add_bdepend "test? (
#		dev-ruby/active_model_serializers:0.10
#	)"

each_ruby_test() {
	${RUBY} -S rspec-3 spec/draper || die
}
