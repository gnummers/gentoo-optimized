# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="Routing tree web toolkit"
HOMEPAGE="https://roda.jeremyevans.net/"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack:*"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.7.0 )"
