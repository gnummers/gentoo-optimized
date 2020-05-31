# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Extension of the Authlogic library to add OpenID support."
HOMEPAGE="http://authlogic-oid.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86-macos"
SLOT="0"
IUSE=""

# Use a fork in the network that has many, many bug fixes and seems the
# most coherent fork
#SRC_URI="https://github.com/whitequark/authlogic_openid/tarball/0a5b3772437ac0ebb3b5ecd7ce53f51688d60345 -> ${P}.tgz"
SRC_URI="http://moving-innovations.com/~graaff/authlogic-oid-1.0.4.tgz"
RUBY_S="whitequark-authlogic_openid-*"

# Tests use hardcoded path to authlogic
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/hoe )"

ruby_add_rdepend ">=dev-ruby/authlogic-3.8:*"

all_ruby_prepare() {
	# Remove reference to documenation template we don't have.
	sed -i -e 's/-T hanna//' Rakefile || die

	eapply "${FILESDIR}/${P}-rails51.patch"
}
