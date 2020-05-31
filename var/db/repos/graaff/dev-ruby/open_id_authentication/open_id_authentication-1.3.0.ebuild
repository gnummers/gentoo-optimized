# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_GEMSPEC="open_id_authentication.gemspec"

inherit ruby-fakegem

DESCRIPTION="a thin wrapper around the excellent ruby-openid gem from JanRain."
HOMEPAGE="https://github.com/grosser/open_id_authentication"
SRC_URI="https://github.com/grosser/open_id_authentication/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-openid-1.3"
