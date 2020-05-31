# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Automatically reloads when changes are detected"
HOMEPAGE="https://github.com/ddfreyne/adsf/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "
	www-servers/adsf:0
	>=dev-ruby/em-websocket-0.5:0
	>=dev-ruby/eventmachine-1.2:0
	dev-ruby/listen:3
	>=dev-ruby/rack-livereload-0.3:0
"
