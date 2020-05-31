# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="stylesheets"

inherit ruby-fakegem

DESCRIPTION="Really Simple Media Queries with Sass"
HOMEPAGE="https://github.com/Team-Sass/breakpoint"

LICENSE="|| ( MIT GPL-2 )"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3.0:* =dev-ruby/sass-3*:*
	dev-ruby/sassy-maps:0"
