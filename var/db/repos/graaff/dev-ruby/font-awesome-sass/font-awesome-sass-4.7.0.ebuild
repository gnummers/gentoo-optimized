# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="assets"

inherit ruby-fakegem

DESCRIPTION="Font-Awesome Sass gem for use in Ruby/Rails projects"
HOMEPAGE="https://github.com/FortAwesome/font-awesome-sass"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="4"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/sass-3.2:*
"
