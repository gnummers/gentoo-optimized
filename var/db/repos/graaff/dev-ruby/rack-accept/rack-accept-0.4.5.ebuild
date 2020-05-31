# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

inherit ruby-fakegem

DESCRIPTION="HTTP Accept, Accept-Charset, Accept-Encoding, and Accept-Language for Ruby/Rack"
HOMEPAGE="https://github.com/mjackson/rack-accept"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rack-0.4:*
"
