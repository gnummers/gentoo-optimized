# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Cross platform mac address determination for ruby"
HOMEPAGE="https://github.com/ahoward/macaddr"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/systemu-2.6.2 =dev-ruby/systemu-2.6*"

all_ruby_prepare() {
	sed -i -e 's/Config/RbConfig/' Rakefile || die
}
