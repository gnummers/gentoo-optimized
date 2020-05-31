# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Builds ActiveRecord joins from association paths"
HOMEPAGE="https://pat.github.io/thinking-sphinx"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1-2)"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-5.2.0:*"

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
