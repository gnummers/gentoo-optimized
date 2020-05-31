# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A lightweight database toolkit for Ruby"
HOMEPAGE="http://sequel.jeremyevans.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Unpackaged dependencies
RESTRICT="test"
