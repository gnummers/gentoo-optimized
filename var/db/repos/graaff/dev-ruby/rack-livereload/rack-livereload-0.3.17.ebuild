# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="js skel"

inherit eapi7-ver ruby-fakegem

DESCRIPTION="Insert LiveReload into your app easily as Rack middleware"
HOMEPAGE="https://github.com/onesupercoder/rack-livereload"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/rack
"
