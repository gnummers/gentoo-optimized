# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app vendor"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Integration of TinyMCE with the Rails asset pipeline"
HOMEPAGE="https://github.com/spohlenz/tinymce-rails"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1.1:*"
