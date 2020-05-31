# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_NAME="scss_lint"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="data config"

inherit ruby-fakegem

DESCRIPTION="Configurable tool for writing clean and consistent SCSS"
HOMEPAGE="https://github.com/causes/scss-lint"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/sass-3.5.5:* =dev-ruby/sass-3*:*
"

all_ruby_prepare() {
	# Skip tests that fail on legacy exist? method
	rm -f spec/scss_lint/plugins/linter_gem_spec.rb || die

	sed -i -e '/simplecov/ s:^:#:' \
		-e '1igem "sass", ">= 3.5"' spec/spec_helper.rb || die
}
