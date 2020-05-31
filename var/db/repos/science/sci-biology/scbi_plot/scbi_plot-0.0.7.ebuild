# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc History.txt"

inherit ruby-fakegem

DESCRIPTION="Wrapper to create plots with gnuplot"
HOMEPAGE="https://rubygems.org/gems/scbi_plot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=dev-ruby/hoe-2.8.0
	>=dev-ruby/rdoc-4.0"
RDEPEND="${DEPEND}
	>=sci-visualization/gnuplot-2.3.0"
