# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Parses, validates, and formats local and international phone numbers"
HOMEPAGE="https://github.com/sstephenson/global_phone"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"

all_ruby_prepare() {
	sed -e '/REMOTE_URL/ s/http/https/' -e '/REMOTE_URL/ s/MetaData/Metadata/' -i bin/global_phone_dbgen || die
}
