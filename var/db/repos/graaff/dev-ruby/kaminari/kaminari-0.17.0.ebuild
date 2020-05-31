# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="app config"

inherit ruby-fakegem

DESCRIPTION="A pagination engine plugin for Rails 3+ and other modern frameworks"
HOMEPAGE="https://github.com/amatsuda/kaminari"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-3.0.0:*
	>=dev-ruby/actionpack-3.0.0:*"
