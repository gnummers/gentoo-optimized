# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.jp.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Boot large ruby/rails apps faster"
HOMEPAGE="https://github.com/Shopify/bootsnap"
SRC_URI="https://github.com/Shopify/bootsnap/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "
	dev-ruby/msgpack:0
"

ruby_add_bdepend "test? ( dev-ruby/minitest:5 >=dev-ruby/mocha-1.2:1.0 )"

all_ruby_prepare() {
	sed -e '/rake/ s/10/12/' \
		-e '/rake-compiler/ s:^:#:' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_configure() {
	${RUBY} -Cext/bootsnap extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/bootsnap
	cp ext/bootsnap/bootsnap.so lib/bootsnap/ || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/**/*_test.rb"].each{|f| require f}' || die
}
