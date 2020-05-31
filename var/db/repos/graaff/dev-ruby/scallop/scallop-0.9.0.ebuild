# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

# Uses rspec but specs not packaged and git not tagged.
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Ergonomic shell wrapper"
HOMEPAGE="https://github.com/fetlife/scallop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
