# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

COMMIT=a8b48218bbac7abb9f7af3c4db007b3f260ec5bd

DESCRIPTION="Adds methods to set and authenticate against one time passwords"
HOMEPAGE="https://github.com/heapsource/active_model_otp"
SRC_URI="https://github.com/heapsource/active_model_otp/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	dev-ruby/activemodel:*
	dev-ruby/rotp:4
"

all_ruby_prepare() {
	sed -i -e '/rotp/ s/$/, "~> 4.0"/' ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -i -e '1igem "rotp", "~> 4.0"' test/test_helper.rb || die
}
