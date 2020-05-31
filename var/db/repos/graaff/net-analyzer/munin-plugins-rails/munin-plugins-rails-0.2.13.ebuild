# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="munin"

inherit ruby-fakegem

DESCRIPTION="Collection of Concise Munin plugins for Rails server environments."
HOMEPAGE="http://barttenbrinke.github.com/munin-plugins-rails/"
SRC_URI="https://github.com/barttenbrinke/munin-plugins-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
