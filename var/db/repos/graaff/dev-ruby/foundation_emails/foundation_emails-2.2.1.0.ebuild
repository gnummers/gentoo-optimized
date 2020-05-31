# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="A framework for creating responsive HTML emails that work in any email client"
HOMEPAGE="http://foundation.zurb.com/emails"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""
