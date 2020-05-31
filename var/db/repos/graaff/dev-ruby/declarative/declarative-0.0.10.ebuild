# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="DSL for nested generic schemas with inheritance and refining"
HOMEPAGE="https://github.com/apotonick/declarative"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
