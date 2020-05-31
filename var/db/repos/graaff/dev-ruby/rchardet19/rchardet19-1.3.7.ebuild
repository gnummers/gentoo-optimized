# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.markdown"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A character encoding detection library for ruby."
HOMEPAGE="https://github.com/edouard/rchardet"
LICENSE="LGPL-2.1"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
