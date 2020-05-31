# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md SUPPORT.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="ext resources"

AGENT_VERSION=c348132

inherit ruby-fakegem

DESCRIPTION="The official appsignal.com gem"
HOMEPAGE="https://docs.appsignal.com/ruby/"
SRC_URI="https://rubygems.org/gems/appsignal-${PV}.gem https://appsignal-agent-releases.global.ssl.fastly.net/${AGENT_VERSION}/appsignal-x86_64-linux-all-static.tar.gz -> appsignal-x86_64-${PV}.patch.bz2"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/rack:*
"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/timecop
	dev-ruby/webmock
)"

all_ruby_prepare() {
	sed -i -e '/rake/ s/~>/>=/' -e '/\("rubocop\|pry\)/ s:^:#:' appsignal.gemspec || die
	sed -i -e '/pry/ s:^:#:' spec/spec_helper.rb || die

	# This is a horrible hack to work around the default unpack support
	# in all_ruby_unpack which tries to unpack all files in ${A} and
	# then fails. But it leaves a patch.bz2 file untouched...
	pushd ext || die
	cp "${DISTDIR}/appsignal-x86_64-${PV}.patch.bz2" appsignal-x86_64-linux-all-static.tar.gz || die
	popd || die
	sed -i -e 's/download_archive(library_type)/open("appsignal-x86_64-linux-all-static.tar.gz")/' ext/extconf.rb || die

	# Avoid specs that require a network
	sed -i -e '/\(the\|extension\) installation report/askip "requires live network"' spec/lib/appsignal/cli/diagnose_spec.rb || die
}

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext
}

each_ruby_test() {
	${RUBY} -S bundle exec rspec-3 spec || die
}
