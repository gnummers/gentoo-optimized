# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="A rails form builder to create forms using Bootstrap 4"
HOMEPAGE="https://github.com/bootstrap-ruby/bootstrap_form"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="4"
IUSE=""

# tests not included in gem, will also require custom setup to test
# various gemfiles.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/rails-5:*"
