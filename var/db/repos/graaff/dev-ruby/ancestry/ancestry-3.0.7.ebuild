# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Allows records to be organized in a tree structure"
HOMEPAGE="https://github.com/stefankroes/ancestry"
SRC_URI="https://github.com/stefankroes/ancestry/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

# Depends on appraisal which is not packaged yet
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/activerecord-3.2.0:*
"
