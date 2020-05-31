# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Extraction of the key_transform abilities of ActiveModelSerializers"
HOMEPAGE="https://github.com/rails-api/case_transform"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# No tests in gem and no tagged release.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/activesupport:*
"
