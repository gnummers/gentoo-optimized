# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="iniparse.gemspec"

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for parsing INI configuration and data files"
HOMEPAGE="https://github.com/antw/iniparse"
SRC_URI="https://github.com/antw/iniparse/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
