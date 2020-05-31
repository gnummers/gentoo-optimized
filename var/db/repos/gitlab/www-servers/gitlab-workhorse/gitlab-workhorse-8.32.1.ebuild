# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EGIT_REPO_URI="https://gitlab.com/gitlab-org/gitlab-workhorse.git"
EGIT_COMMIT="v${PV}"

inherit eutils git-r3 user

DESCRIPTION="Handles slow HTTP requests for GitLab"
HOMEPAGE="https://about.gitlab.com/gitlab-workhorse/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
RESTRICT="network-sandbox"

DEPEND=">=dev-lang/go-1.10.0"
RDEPEND="${DEPEND}"

src_install()
{
	into "/usr"
	dobin "gitlab-workhorse"
	dobin "gitlab-zip-cat"
	dobin "gitlab-zip-metadata"
}
