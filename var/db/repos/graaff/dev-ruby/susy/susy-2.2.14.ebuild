# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="docs/changelog.rst README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="sass templates VERSION"

inherit ruby-fakegem

DESCRIPTION="A semantic CSS grid system with a responsive twist"
HOMEPAGE="http://oddbird.net/susy/"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3.0:* <dev-ruby/sass-3.5:*"
