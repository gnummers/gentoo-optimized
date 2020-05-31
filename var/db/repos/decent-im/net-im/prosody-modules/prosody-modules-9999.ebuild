# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial

DESCRIPTION="Add-on modules for Prosody XMPP server"
HOMEPAGE="https://modules.prosody.im/"
EHG_REPO_URI="https://hg.prosody.im/prosody-modules"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

src_install() {
	insinto /usr/lib/prosody/modules;
	doins -r misc mod_*
}
