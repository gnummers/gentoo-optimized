# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Various extensions to the base thread library"
HOMEPAGE="https://github.com/meh/ruby-thread"
LICENSE="WTFPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
