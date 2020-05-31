# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRA_DOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A simple mixin for CLI interfaces, including option parsing"
HOMEPAGE="https://github.com/opscode/mixlib-cli"
SRC_URI="https://github.com/opscode/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
