# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A thin wrapper around HTTParty to provide multipart uploads"
HOMEPAGE="https://github.com/jwagener/httmultiparty"
SRC_URI="https://github.com/jwagener/httmultiparty/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/httparty-0.7.3
	dev-ruby/multipart-post
	dev-ruby/mimemagic
"
