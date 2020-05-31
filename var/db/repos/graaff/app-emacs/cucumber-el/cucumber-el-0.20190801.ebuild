# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

GIT_COMMIT=11ae1671629bfedaa553c7b819676d64eb320992

IUSE="test"

DESCRIPTION="A major mode for editing Cucumber stories."
HOMEPAGE="https://github.com/michaelklishin/cucumber.el"
SRC_URI="https://github.com/michaelklishin/cucumber.el/archive/${GIT_COMMIT}.tar.gz -> ${P}-git.tgz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/cucumber.el-${GIT_COMMIT}"

RDEPEND="
	dev-ruby/ruby_parser
	>=dev-ruby/gherkin-2.11.8
"

DEPEND="test? ( dev-ruby/bundler dev-util/cucumber )"

src_prepare() {
	rm -f Gemfile.lock || die

	# Loosen gherkin dependency
	sed -i -e '/gherkin/ s/4.0.0/6.0.0/' Gemfile support/find_step.rb || die

	default
}

src_install() {
	elisp_src_install

	elisp-install ${PN}/support support/find_step.rb

	dodoc README.md
}
