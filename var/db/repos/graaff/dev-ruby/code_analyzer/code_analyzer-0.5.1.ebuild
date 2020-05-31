# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Code analyzer helps you build your own code analyzer tool."
HOMEPAGE="https://github.com/flyerhzm/code_analyzer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.5"
IUSE="doc"

ruby_add_rdepend "dev-ruby/sexp_processor"
