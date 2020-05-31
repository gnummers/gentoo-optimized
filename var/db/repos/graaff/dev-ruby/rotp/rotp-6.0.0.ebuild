# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Works for both HOTP and TOTP, and includes QR Code provisioning"
HOMEPAGE="https://github.com/mdp/rotp"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/addressable-2.7:0
"

ruby_add_bdepend "
	test? ( dev-ruby/timecop )
"

all_ruby_prepare() {
	# Remove pregenerated documentation so we can update it.
	rm -rf doc || die

	sed -e '/simplecov/,/^end/ s:^:#:' \
		-e '1irequire "uri"' \
		-i spec/spec_helper.rb || die
}
