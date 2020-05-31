# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Simple DSL in order to recursively query page/section/element structures"
HOMEPAGE="https://github.com/site-prism/site_prism-all_there"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Not packaged by default and avoids a circular dependency with site_prism.
RESTRICT="test"
