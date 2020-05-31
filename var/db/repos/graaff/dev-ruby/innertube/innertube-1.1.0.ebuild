# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A thread-safe resource pool, originally borne in riak-client (Ripple)"
HOMEPAGE="https://github.com/basho/innertube"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
