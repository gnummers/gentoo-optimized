# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="sass"

inherit ruby-fakegem

DESCRIPTION="Map helper functions for Sass 3.3 Maps including get-deep and set/set-deep"
HOMEPAGE="https://github.com/Snugug/Sassy-Maps"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3:* =dev-ruby/sass-3*:*"
