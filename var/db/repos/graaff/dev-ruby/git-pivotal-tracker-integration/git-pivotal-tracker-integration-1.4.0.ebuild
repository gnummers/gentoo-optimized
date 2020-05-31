# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""

# Not all files present.
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A set of Git commands to help developers when working with Pivotal Tracker"
HOMEPAGE="https://github.com/nebhale/git-pivotal-tracker-integration"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/pivotal-tracker-0.5"
