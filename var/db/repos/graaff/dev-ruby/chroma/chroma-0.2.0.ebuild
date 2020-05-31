# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Color manipulation and palette generation"
HOMEPAGE="https://github.com/jfairbank/chroma"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
