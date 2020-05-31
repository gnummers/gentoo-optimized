# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="config libexec template-dir"

# Needs to work around require_relative
# RUBY_FAKEGEM_GEMSPEC="overcommit.gemspec"

inherit ruby-fakegem

DESCRIPTION="The Opinionated Git Hook Manager"
HOMEPAGE="https://github.com/sds/overcommit"
SRC_URI="https://github.com/causes/overcommit/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/childprocess:2
	>=dev-ruby/iniparse-1.4:1
"

each_ruby_install() {
	each_fakegem_install

	local hookdir
	hookdir="$(ruby_fakegem_gemsdir)/gems/${RUBY_FAKEGEM_NAME}-${RUBY_FAKEGEM_VERSION}/template-dir/hooks"

	fperms 0755 "${hookdir}"/{commit-msg,overcommit-hook,post-checkout,post-commit,post-merge,post-rewrite,pre-commit,prepare-commit-msg,pre-push,pre-rebase}
}
