# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Fixes redirects to login pages when following links from a Microsoft application"
HOMEPAGE="https://github.com/spilliton/fix_microsoft_links"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/rack-1.1.1:*"
