# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app config"

inherit ruby-fakegem

DESCRIPTION="Displays a cookie consent"
HOMEPAGE="https://github.com/infinum/cookies_eu"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "=dev-ruby/js_cookie_rails-2.2*"
