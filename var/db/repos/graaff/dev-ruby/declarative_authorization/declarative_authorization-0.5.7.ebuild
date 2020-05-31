# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

# Don't work due to Rails version problems.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="app authorization_rules.dist.rb init.rb"

inherit ruby-fakegem

DESCRIPTION="Plugin that offers an authorization mechanism inspired by RBAC."
HOMEPAGE="https://github.com/stffn/declarative_authorization"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
