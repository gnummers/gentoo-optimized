# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Builds ActiveRecord joins from association paths"
HOMEPAGE="http://pat.github.io/thinking-sphinx"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.3"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.1.0:*"

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
