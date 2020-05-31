# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="With the swf_fu plugin, rails treats your swf files like any other asset."
HOMEPAGE="https://github.com/marcandre/swf_fu"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Bundler madness and depends on newer shoulda-context, not yet packaged.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/coffee-script >=dev-ruby/rails-3.1:*"
