# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="vendor"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A simple, lightweight JavaScript API for handling cookies"
HOMEPAGE="https://github.com/freego/js_cookie_rails"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1:*"
