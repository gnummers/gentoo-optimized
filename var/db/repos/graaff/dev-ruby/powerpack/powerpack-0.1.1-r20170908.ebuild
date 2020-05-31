# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="powerpack.gemspec"

COMMIT=f7e2b9b7815e8fc202bd8874ed9376011af4a203

inherit ruby-fakegem

DESCRIPTION="A few useful extensions to core Ruby classes"
HOMEPAGE="https://github.com/bbatsov/powerpack"
SRC_URI="https://github.com/bbatsov/powerpack/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
