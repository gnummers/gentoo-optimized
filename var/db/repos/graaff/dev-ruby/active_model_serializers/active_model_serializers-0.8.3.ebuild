# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md DESIGN.textile README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Making it easy to serialize models for client-side use"
HOMEPAGE="https://github.com/rails-api/active_model_serializers"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

# A bit more complicated setup than I have time for now...
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/activemodel-3.0:*"

#ruby_add_bdepend "test? ( >=dev-ruby/rails-3.0 )"
