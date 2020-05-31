# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Works for both HOTP and TOTP, and includes QR Code provisioning"
HOMEPAGE="https://github.com/mdp/rotp"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/addressable-2.5:0
"

ruby_add_bdepend "
	test? ( dev-ruby/timecop )
"

all_ruby_prepare() {
	# Remove pregenerated documentation so we can update it.
	rm -rf doc || die

	sed -i -e '/simplecov/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
