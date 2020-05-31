# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Generates Rails 3/4/5 model and controller UML diagrams"
HOMEPAGE="http://railroady.prestonlee.com"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-gfx/graphviz"

ruby_add_bdepend "test? ( dev-ruby/activesupport )"
