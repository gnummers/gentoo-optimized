# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="SSHKit extension, for sudo operation with password input"
HOMEPAGE="https://github.com/kentaroi/sshkit-sudo"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

PATCHES=( "${FILESDIR}/sshkit-0.1.0-multiple-servers.patch" )

ruby_add_rdepend ">=dev-ruby/sshkit-1.8"
