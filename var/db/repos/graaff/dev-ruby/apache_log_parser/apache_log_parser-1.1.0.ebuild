# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A library designed to easily parse and access standard Apache log files."
HOMEPAGE="https://github.com/watsonian/apache_log_parser"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
