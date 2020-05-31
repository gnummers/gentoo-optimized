# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

GIT_COMMIT="aa06b88ad96bc556992f011b6aef9b78e99ae48b"

IUSE=""

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

src_prepare() {
	rm -f Gemfile.lock || die

	default
}

src_install() {
	elisp_src_install

	elisp-install ${PN}/support support/find_step.rb

	dodoc README.md
}
